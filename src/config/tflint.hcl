config {
  plugin_dir = "$HOME/.tflint.d/plugins"
}

plugin "aws" {
  enabled = true
  version = "0.44.0"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
}

plugin "terraform" {
  enabled = true
  version = "0.13.0"
  source  = "github.com/terraform-linters/tflint-ruleset-terraform"
}

rule "aws_resource_missing_tags" {
  enabled = true
  tags    = [
    "Namespace",
    "Service",
    "Environment",
    "Name",
  ]
  exclude = []
}

rule "terraform_standard_module_structure" {
  enabled = false
}
