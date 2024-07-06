output "sns_topic_arn" {
  value = aws_sns_topic.key_rotation_topic.arn
}
