resource "aws_sns_topic" "key_rotation_topic" {
  name = "key_rotation_topic"
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.key_rotation_topic.arn
  protocol  = "email"
  endpoint  = var.sns_subscription_email
}
