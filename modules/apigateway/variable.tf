variable "region" {
  description = "La région AWS où le dépôt ECR est hébergé"
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