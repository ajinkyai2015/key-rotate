output "iam_role_arn" {
  description = "ARN of the IAM role created for Lambda"
  value       = aws_iam_role.lambda_iam_role.arn
}

output "iam_policy_arn" {
  description = "ARN of the IAM policy created for Lambda"
  value       = aws_iam_policy.lambda_iam_policy.arn
}
