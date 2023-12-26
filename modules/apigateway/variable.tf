variable "region" {
  description = "La région AWS où le dépôt ECR est hébergé"
  type        = string
}

variable "dynamodb_arn" {
  description = "ARN of the DynamoDB to use"
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

variable "get_status_prod_lambda_arn" {
  description = "ARN of Lambda function getStatusProd"
  type        = string
}

variable "get_users_prod_lambda_arn" {
  description = "ARN of Lambda function getUsersProd"
  type        = string
}

variable "post_users_prod_lambda_arn" {
  description = "ARN of Lambda functionpostUsersProd"
  type        = string
}

