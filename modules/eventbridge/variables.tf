variable "lambda_function_arn" {
  description = "The ARN of the Lambda function"
  type        = string
}

variable "sns_topic_arn" {
  description = "The ARN of the SNS topic"
  type        = string
}

variable "env1_create_key" {
  description = "Number of days after which to create new key"
  type        = string
}

variable "env2_disable_key" {
  description = "Number of days after which to disable old key"
  type        = string
}

variable "env3_delete_key" {
  description = "Number of days after which to delete old key"
  type        = string
}

variable "last_used_threshold" {
  description = "Number of days after which key is considered not used"
  type        = string
}