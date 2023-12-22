resource "aws_lambda_function" "get_users_prod" {
  function_name = "get_users_prod"
  role          = aws_iam_role.get_users_prod.arn
  handler       = "get_users_prod.lambda_handler"

  source_code_hash = filebase64sha256("${path.module}/get_users_prod/get_users_prod.zip")
  runtime          = "python3.11"
  filename         = "${path.module}/get_users_prod/get_users_prod.zip"

  environment {
    variables = {
      table_name = var.table_name
    }
  }
}