# Entrypoint for the label module.
#
# This module references the cloudposse/terraform-null-label module (Apache-2.0).
# https://github.com/cloudposse/terraform-null-label

locals {
  additional_tag_map = {
    Service = var.tenant
  }
  merged_additional_tag_map = merge(
    local.additional_tag_map,
    var.additional_tag_map,
  )
}

module "this" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  namespace   = var.namespace
  tenant      = var.tenant
  environment = var.environment
  name        = var.name
  attributes  = var.attributes
  context     = var.context

  label_order    = var.label_order
  labels_as_tags = var.labels_as_tags

  additional_tag_map = local.merged_additional_tag_map
}
