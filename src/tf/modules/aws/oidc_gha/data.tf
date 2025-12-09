# Data sources for the oidc_gha module.

data "tls_certificate" "github" {
  url = local.url
}
