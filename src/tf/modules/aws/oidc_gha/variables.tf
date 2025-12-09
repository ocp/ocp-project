# Variables for the oidc_gha module.

variable "allowed_oidc" {
  description = "Github org/repos/branches allowed to assume the OIDC role."
  type        = list(map(string))
}

variable "label_context" {
  description = "The label context from the calling module."
  type        = any
}

variable "role_name" {
  description = "Name of the Github Actions OIDC role."
  type        = string
  default     = "GhaOIDCRole"
}
