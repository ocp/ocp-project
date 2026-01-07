# Providers for the acm_certificate_dns module.

terraform {
  required_version = "~> 1.14"

  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = "6.27.0"
      configuration_aliases = [aws.acm, aws.dns]
    }
  }
}
