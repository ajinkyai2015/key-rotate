variable "region" {
  description = "The AWS region to deploy resources in"
  default     = "us-west-2"
}

variable "sns_subscription_email" {
  description = "The email address to subscribe to the SNS topic"
  type        = string
}

variable "env1_create_key" {
  description = "The number of days after which a new key is created"
  default     = "165"
}

variable "env2_disable_key" {
  description = "The number of days after which the old key is disabled"
  default     = "180"
}

variable "env3_delete_key" {
  description = "The number of days after which the old key is deleted"
  default     = "185"
}

variable "last_used_threshold" {
  description = "The threshold for last used date to decide deactivation"
  default     = "30"
}
