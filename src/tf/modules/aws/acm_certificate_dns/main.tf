# Entrypoint for the acm_certificate_dns module.
#
# This module currently assumes a 'flat' DNS configuration (everything is done
# in a single, central account where all domains are registered and have their
# canonical hosted zones) as that's all we need currently. We might make it
# more flexible in the future, passing in zone_ids and additional provider
# aliases. But we'll keep it simple for now.

locals {
  zone_domains              = concat([var.domain], var.additional_domains)
  subject_alternative_names = distinct(var.additional_domains)
  zone_ids = {
    for zone in data.aws_route53_zone.this : zone.name => zone.zone_id
  }
}

resource "aws_acm_certificate" "this" {
  provider = aws.acm

  domain_name               = var.domain
  subject_alternative_names = local.subject_alternative_names
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  tags = module.label.tags
}

resource "aws_route53_record" "this" {
  provider = aws.dns

  for_each = {
    for dvo in aws_acm_certificate.this.domain_validation_options : dvo.domain_name => {
      name    = dvo.resource_record_name
      record  = dvo.resource_record_value
      type    = dvo.resource_record_type
      zone_id = local.zone_ids[dvo.domain_name]
    } if !strcontains(dvo.domain_name, "*.")
  }

  allow_overwrite = var.allow_validation_overwrite
  name            = each.value.name
  records         = [each.value.record]
  ttl             = var.dns_ttl
  type            = each.value.type
  zone_id         = each.value.zone_id
}

resource "aws_acm_certificate_validation" "this" {
  provider = aws.acm

  certificate_arn = aws_acm_certificate.this.arn
  validation_record_fqdns = [
    for record in aws_route53_record.this : record.fqdn
  ]
}
