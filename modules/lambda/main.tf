resource "aws_lambda_function" "key_rotation" {
  function_name = "key_rotation_${terraform.workspace}"
  role          = aws_iam_role.lambda_iam_role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.9"
  filename      = "${path.module}/lambda.zip"
  source_code_hash = filebase64sha256("${path.module}/lambda.zip")

  environment {
    variables = {
      SNS_TOPIC_ARN       = var.sns_topic_arn
      env1_create_key     = var.env1_create_key
      env2_disable_key    = var.env2_disable_key
      env3_delete_key     = var.env3_delete_key
      last_used_threshold = var.last_used_threshold
    }
  }
}


resource "aws_lambda_permission" "allow_eventbridge" {
  statement_id  = "AllowExecutionFromEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.key_rotation.function_name
  principal     = "events.amazonaws.com"
  source_arn    = var.eventbridge_rule_arn
}
