output "sns_topic_arn" {
  description = "ARN of the SNS topic created"
  value       = aws_sns_topic.key_rotation_topic.arn
}
