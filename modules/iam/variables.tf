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
