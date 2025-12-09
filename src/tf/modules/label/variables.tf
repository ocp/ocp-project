# Variables for the label module.

variable "additional_tag_map" {
  description = "Value to render out additional tags at will."
  type        = map(string)
  default     = {}
}

variable "attributes" {
  description = "Additional fine-grained labelling data."
  type        = list(string)
  default     = null
}

variable "context" {
  description = "Another label's context for extension."
  type        = any
  default = {
    "additional_tag_map" : {},
    "attributes" : [],
    "delimiter" : null,
    "descriptor_formats" : {},
    "enabled" : true,
    "environment" : null,
    "id_length_limit" : null,
    "label_key_case" : null,
    "label_order" : [],
    "label_value_case" : null,
    "labels_as_tags" : [
      "unset",
    ],
    "name" : null,
    "namespace" : null,
    "regex_replace_chars" : null,
    "stage" : null,
    "tags" : {},
    "tenant" : null
  }
}

variable "environment" {
  description = "Identify the deployment environment."
  type        = string
  default     = null
}

variable "name" {
  description = "The main label identifier."
  type        = string
  default     = null
}

variable "namespace" {
  description = "The top-level namespace."
  type        = string
  default     = null
}

variable "label_order" {
  description = "The pattern used to render out the label's components."
  type        = list(string)
  default = [
    "namespace",
    "tenant", # Semantically overloaded as 'Service' in our tags.
    "environment",
    "name",
    "attributes",
  ]
}

variable "labels_as_tags" {
  description = "Components that we want to render as tags."
  type        = list(string)
  default = [
    "environment",
    "namespace",
    "name",
  ]
}

variable "tenant" {
  description = "The tenant namespace (which we overload as our 'service' key)."
  type        = string
  default     = null
}
