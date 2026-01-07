# Variables for the acm_certificate_dns module.

variable "additional_domains" {
  description = "Any other domains to be secured by this certificate as SANs."
  type        = list(string)
  default     = []
}

variable "allow_validation_overwrite" {
  description = "Should DNS validation records be write-once."
  type        = bool
  default     = false
}

variable "dns_ttl" {
  description = "Time to live for the certificate's DNS record."
  type        = number
  default     = 60
}

variable "domain" {
  description = "The primary domain name for which the certificate is issued."
  type        = string
}

variable "label_context" {
  description = "The label context from the calling module."
  type        = any
}
