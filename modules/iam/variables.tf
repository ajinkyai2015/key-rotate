variable "readonly_role_name" {
  description = "The name of the read-only role"
  type        = string
  default     = "readonly-role"
}

variable "readonly_user_name" {
  description = "The name of the read-only user"
  type        = string
  default     = "readonly-user"
}

variable "secrets_manager_secret_name" {
  description = "The name of the Secrets Manager secret"
  type        = string
  default     = "readonly-user-credentials"
}

variable "AWS_ACCESS_KEY_ID" {
  description = "The AWS access key ID for authentication"
  type        = string
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "The AWS secret access key for authentication"
  type        = string
}
