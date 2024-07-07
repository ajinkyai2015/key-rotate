# output "iam_role_arn" {
#   description = "ARN of the IAM role created for Lambda"
#   value       = module.iam.iam_role_arn
# }

# output "iam_policy_arn" {
#   description = "ARN of the IAM policy created for Lambda"
#   value       = module.iam.iam_policy_arn
# }

output "lambda_function_arn" {
  description = "ARN of the Lambda function created"
  value       = module.lambda.lambda_function_arn
}

output "sns_topic_arn" {
  description = "ARN of the SNS topic created"
  value       = module.sns.sns_topic_arn
}
