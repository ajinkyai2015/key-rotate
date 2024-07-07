# output "iam_role_arn" {
#   description = "ARN of the IAM role created for Lambda"
#   value       = module.iam.iam_role_arn
# }

# output "iam_policy_arn" {
#   description = "ARN of the IAM policy created for Lambda"
#   value       = module.iam.iam_policy_arn
# }

output "readonly_user_access_key_id" {
  description = "The access key ID of the read-only user"
  value       = module.iam.readonly_user_access_key_id
}

output "readonly_user_secret_arn" {
  description = "The ARN of the Secrets Manager secret"
  value       = module.iam.readonly_user_secret_arn
}

output "lambda_function_arn" {
  description = "ARN of the Lambda function created"
  value       = module.lambda.lambda_function_arn
}

output "sns_topic_arn" {
  description = "ARN of the SNS topic created"
  value       = module.sns.sns_topic_arn
}

output "ec2_instance_id" {
  description = "The ID of the EC2 instance"
  value       = module.ec2.instance_id
}

output "ec2_instance_public_ip" {
  description = "The public IP of the EC2 instance"
  value       = module.ec2.instance_public_ip
}

output "ec2_instance_id" {
  description = "The ID of the EC2 instance"
  value       = module.ec2.instance_id
}

output "ec2_instance_public_ip" {
  description = "The public IP of the EC2 instance"
  value       = module.ec2.instance_public_ip
}
