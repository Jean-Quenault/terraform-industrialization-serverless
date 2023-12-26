output "get_status_prod_lambda_arn" {
  value = aws_lambda_function.get_status_prod.arn
}

output "get_users_prod_lambda_arn" {
  value = aws_lambda_function.get_users_prod.arn
}

output "post_users_prod_lambda_arn" {
  value = aws_lambda_function.post_users_prod.arn
}

output "get_status_prod_function_name" {
  value = aws_lambda_function.get_status_prod.function_name
}

output "get_users_prod_function_name" {
  value = aws_lambda_function.get_users_prod.function_name
}

output "post_users_prod_function_name" {
  value = aws_lambda_function.post_users_prod.function_name
}