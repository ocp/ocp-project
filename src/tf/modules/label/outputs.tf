# Outputs for the label module.

output "context" {
  description = "Expose the label's context for extension."
  value       = module.this.context
}

output "id" {
  description = "Normalize out the full label string."
  value       = module.this.id
}

output "tags" {
  description = "Expose the the label's tags."
  value       = module.this.tags
}
