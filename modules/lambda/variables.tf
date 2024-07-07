variable "sns_topic_arn" {
  description = "The ARN of the SNS topic"
  type        = string
}

variable "lambda_role_arn" {
  description = "The ARN of the IAM role for the Lambda function"
  type        = string
}

variable "eventbridge_rule_arn" {
  description = "The ARN of the EventBridge rule"
  type        = string
  default     = ""
}

variable "env1_create_key" {
  description = "The number of days after which a new key is created"
  type        = string
}

variable "env2_disable_key" {
  description = "The number of days after which the old key is disabled"
  type        = string
}

variable "env3_delete_key" {
  description = "The number of days after which the old key is deleted"
  type        = string
}

variable "last_used_threshold" {
  description = "The threshold for last used date to decide deactivation"
  type        = string
}

variable "lambda_role_arn" {
  description = "ARN of the IAM role to be used by Lambda function"
  type        = string
}
