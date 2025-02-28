variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "Name of the AWS CLI profile used for authentication"
  type        = string
  default     = "default"
}

variable "vpc_cidr" {
  description = "VPC CIDR Block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "alarm_email" {
  type        = string
  description = "Email address to receive SNS notifications"
  default     = "your-email@example.com" #Set it to your email
}

variable "target_cpu_value" {
  type    = number
  default = 70
}