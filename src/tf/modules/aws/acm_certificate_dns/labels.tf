# Labels for the acm_certificate_dns module.

module "label" {
  source = "github.com/ocp/ocp-project//src/tf/modules/label?ref=v0.0.1-rc.7"

  attributes = ["acm", "certificate", "dns"]

  context = var.label_context
}
