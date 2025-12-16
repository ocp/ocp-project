# Variables for the oidc_gha module.

variable "allowed" {
  description = "Github org/repos/branches allowed to assume the OIDC role."
  type        = list(map(string))
}

variable "label_context" {
  description = "The label context from the calling module."
  type        = any
}

variable "provider_name" {
  description = "Name suffix for the github action OIDC provider resource."
  type        = string
}

variable "role_name" {
  description = "Name suffix for the Github Actions OIDC role."
  type        = string
}
