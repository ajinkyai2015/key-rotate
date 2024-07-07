output "lambda_iam_role_arn" {
  description = "ARN of the IAM role created for Lambda"
  value       = aws_iam_role.lambda_iam_role.arn
}

# output "lambda_iam_policy_arn" {
#   description = "ARN of the IAM policy created for Lambda"
#   value       = aws_iam_policy.lambda_iam_policy.arn
# }

# output "readonly_role_arn" {
#   description = "The ARN of the read-only role"
#   value       = aws_iam_role.readonly.arn
# }

output "readonly_user_access_key_id" {
  description = "The access key ID of the read-only user"
  value       = aws_iam_access_key.readonly_user_key.id
}

output "readonly_user_secret_arn" {
  description = "The ARN of the Secrets Manager secret"
  value       = aws_secretsmanager_secret.readonly_user_secret.arn
}
