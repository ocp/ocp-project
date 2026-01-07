# Data sources for the acm_certificate_dns module.

data "aws_route53_zone" "this" {
  provider = aws.dns

  for_each = toset(local.zone_domains)
  name     = each.key
}
