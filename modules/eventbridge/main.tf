resource "aws_cloudwatch_event_rule" "schedule_rule" {
  name                = "schedule_rule"
  schedule_expression = "cron(0 12 * * ? *)"
}

resource "aws_cloudwatch_event_target" "lambda_target" {
  rule      = aws_cloudwatch_event_rule.schedule_rule.name
  target_id = "key_rotation"
  arn       = var.lambda_function_arn
}
