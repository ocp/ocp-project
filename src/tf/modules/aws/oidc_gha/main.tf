# Resources for the oidc_gha module.

locals {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.github.certificates[0].sha1_fingerprint]
  url             = "https://token.actions.githubusercontent.com"
}

resource "aws_iam_openid_connect_provider" "github" {
  url             = local.url
  client_id_list  = local.client_id_list
  thumbprint_list = local.thumbprint_list

  tags = module.label.tags
}
