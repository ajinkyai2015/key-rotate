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

variable "ami" {
  description = "The AMI ID to use for the instance"
  type        = string
  default     = "ami-0604d81f2fd264c7b"  # Amazon Linux 2 AMI ID for us-west-2
}

variable "instance_type" {
  description = "The instance type to use for the instance"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "The key name to use for the instance"
  type        = string
}

variable "instance_name" {
  description = "The name tag for the instance"
  type        = string
}

variable "readonly_role_name" {
  description = "The name of the read-only role"
  type        = string
}

variable "readonly_user_name" {
  description = "The name of the read-only user"
  type        = string
}

variable "secrets_manager_secret_name" {
  description = "The name of the Secrets Manager secret"
  type        = string
}

variable "AWS_ACCESS_KEY_ID" {
  description = "The AWS access key ID for authentication"
  type        = string
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "The AWS secret access key for authentication"
  type        = string
}
