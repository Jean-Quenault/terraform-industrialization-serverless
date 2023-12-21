resource "aws_lambda_function" "PostUsersProd" {
  function_name = "PostUsersProd"
  role          = aws_iam_role.post_users_prod.arn
  handler       = "lambda_function.lambda_handler"

  source_code_hash = filebase64sha256("${path.module}/post_users_prod/post_users_prod.zip")
  runtime          = "python3.11"
  filename         = "${path.module}post_users_prod/post_users_prod.zip"

  environment {
    variables = {
      TABLE_NAME = var.table_name
    }
  }
}