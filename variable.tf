variable "vpc_id" {
  description = "ID of the choosen VPC"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "subnet1" {
  description = "ID du premier sous-réseau"
  type        = string
}

variable "subnet2" {
  description = "ID du deuxième sous-réseau"
  type        = string
}

variable "subnet3" {
  description = "ID du troisième sous-réseau"
  type        = string
}

variable "dynamodb_arn" {
  description = "Arn of the DynamoDB to use"
  type        = string
}

variable "table_name" {
  description = "Table name of the DynamoDB to use"
  type        = string
}

variable "backend_url" {
  description = "URL desired for the backend"
  type        = string
}
