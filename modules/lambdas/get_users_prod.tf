resource "aws_lambda_function" "getUsersProd" {
  function_name = "getUsersProd"
  role          = aws_iam_role.get_users_prod.arn
  handler       = "lambda_function.lambda_handler"

  source_code_hash = filebase64sha256("get_users_prod/get_users_prod.zip")
  runtime          = "python3.11"
  filename         = "get_users_prod/get_users_prod.zip"

  environment {
    variables = {
      TABLE_NAME = var.table_name
    }
  }
}