# [Github Actions OIDC](https://registry.terraform.io/modules/terraform-module/github-oidc-provider/aws/latest)

Deploys a Github Actions OIDC provider to your environment.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.14 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 6.27.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | 4.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.27.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.1.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_label"></a> [label](#module\_label) | github.com/ocp/ocp-project//src/tf/modules/label | v0.0.1-rc.7 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_openid_connect_provider.github](https://registry.terraform.io/providers/hashicorp/aws/6.27.0/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/6.27.0/docs/resources/iam_role) | resource |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/6.27.0/docs/data-sources/iam_policy_document) | data source |
| [tls_certificate.github](https://registry.terraform.io/providers/hashicorp/tls/4.1.0/docs/data-sources/certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed"></a> [allowed](#input\_allowed) | Github org/repos/branches allowed to assume the OIDC role. | `list(map(string))` | n/a | yes |
| <a name="input_label_context"></a> [label\_context](#input\_label\_context) | The label context from the calling module. | `any` | n/a | yes |
| <a name="input_provider_name"></a> [provider\_name](#input\_provider\_name) | Name suffix for the github action OIDC provider resource. | `string` | n/a | yes |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | Name suffix for the Github Actions OIDC role. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_policy_document"></a> [policy\_document](#output\_policy\_document) | The OIDC policy document as JSON. |
| <a name="output_provider_arn"></a> [provider\_arn](#output\_provider\_arn) | The ARN of the OIDC provider resource. |
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | The ARN of the role carrying OIDC. |
| <a name="output_role_name"></a> [role\_name](#output\_role\_name) | The name of the role carrying OIDC. |
<!-- END_TF_DOCS -->