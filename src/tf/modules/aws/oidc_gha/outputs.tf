# Outputs for the oidc_gha module.

output "provider_arn" {
  description = "The ARN of the OIDC provider resource."
  value       = aws_iam_openid_connect_provider.github.arn
}

output "policy_document" {
  description = "The oidc policy document json."
  value       = data.aws_iam_policy_document.this.json
}

output "role_arn" {
  description = "The ARN of the role carrying OIDC."
  value       = aws_iam_role.this.arn
}

output "role_name" {
  description = "The name of the role carrying OIDC."
  value       = aws_iam_role.this.name
}

output "simple_role_name" {
  description = "The basic role name that terminates the ARN."
  value       = var.role_name
}
