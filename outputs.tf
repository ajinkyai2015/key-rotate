output "sns_topic_arn" {
  value = module.sns.sns_topic_arn
}

output "lambda_function_arn" {
  value = module.lambda.lambda_function_arn
}

output "ec2_instance_id" {
  description = "The ID of the EC2 instance"
  value       = module.ec2.instance_id
}

output "ec2_instance_public_ip" {
  description = "The public IP of the EC2 instance"
  value       = module.ec2.instance_public_ip
}
