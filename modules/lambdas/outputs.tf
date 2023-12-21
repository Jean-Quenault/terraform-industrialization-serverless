output "get_status_prod_lambda_arn" {
  value = aws_lambda_function.getStatusProd.arn
}

output "get_users_prod_lambda_arn" {
  value = aws_lambda_function.getUsersProd.arn
}

output "post_users_prod_lambda_arn" {
  value = aws_lambda_function.postUsersProd.arn
}
