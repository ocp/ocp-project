<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.14 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 6.27.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws.acm"></a> [aws.acm](#provider\_aws.acm) | 6.27.0 |
| <a name="provider_aws.dns"></a> [aws.dns](#provider\_aws.dns) | 6.27.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_label"></a> [label](#module\_label) | github.com/ocp/ocp-project//src/tf/modules/label | v0.0.1-rc.7 |

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.this](https://registry.terraform.io/providers/hashicorp/aws/6.27.0/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate_validation.this](https://registry.terraform.io/providers/hashicorp/aws/6.27.0/docs/resources/acm_certificate_validation) | resource |
| [aws_route53_record.this](https://registry.terraform.io/providers/hashicorp/aws/6.27.0/docs/resources/route53_record) | resource |
| [aws_route53_zone.this](https://registry.terraform.io/providers/hashicorp/aws/6.27.0/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_domains"></a> [additional\_domains](#input\_additional\_domains) | Any other domains to be secured by this certificate as SANs. | `list(string)` | `[]` | no |
| <a name="input_allow_validation_overwrite"></a> [allow\_validation\_overwrite](#input\_allow\_validation\_overwrite) | Should DNS validation records be write-once. | `bool` | `false` | no |
| <a name="input_dns_ttl"></a> [dns\_ttl](#input\_dns\_ttl) | Time to live for the certificate's DNS record. | `number` | `60` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | The primary domain name for which the certificate is issued. | `string` | n/a | yes |
| <a name="input_label_context"></a> [label\_context](#input\_label\_context) | The label context from the calling module. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_certificate_arn"></a> [certificate\_arn](#output\_certificate\_arn) | The ARN for the (validated) ACM SSL certificate. |
<!-- END_TF_DOCS -->