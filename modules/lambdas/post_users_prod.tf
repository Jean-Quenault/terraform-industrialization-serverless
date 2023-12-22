resource "aws_lambda_function" "post_users_prod" {
  function_name = "post_users_prod"
  role          = aws_iam_role.post_users_prod.arn
  handler       = "post_users_prod.lambda_handler"

  source_code_hash = filebase64sha256("${path.module}/post_users_prod/post_users_prod.zip")
  runtime          = "python3.11"
  filename         = "${path.module}/post_users_prod/post_users_prod.zip"

  environment {
    variables = {
      table_name = var.table_name
    }
  }
}