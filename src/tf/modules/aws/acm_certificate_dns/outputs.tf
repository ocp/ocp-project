# Outputs for the acm_certificate_dns module.

output "certificate_arn" {
  description = "The ARN for the (validated) ACM SSL certificate."
  value       = aws_acm_certificate_validation.this.arn
}
