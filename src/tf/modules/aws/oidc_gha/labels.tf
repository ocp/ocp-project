# Labels for the oidc_gha module.

module "label" {
  source = "/opt/tf//modules/_reusable/label/"

  attributes = ["gha", "oidc", "provider"]

  context = var.label_context
}
