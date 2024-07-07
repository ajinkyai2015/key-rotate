output "lambda_function_arn" {
  description = "ARN of the Lambda function created"
  value       = aws_lambda_function.key_rotation.arn
}
