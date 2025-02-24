variable "aws_region" {
  description = "Région AWS où les ressources seront créées"
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "Nom du profil AWS CLI utilisé pour l'authentification"
  type        = string
  default     = "default"
}

variable "vpc_cidr" {
  description = "CIDR Block du VPC"
  type        = string
  default     = "10.0.0.0/16"
}