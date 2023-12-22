resource "aws_lambda_function" "get_status_prod" {
  function_name = "get_status_prod"
  role          = aws_iam_role.get_status_prod.arn
  handler       = "get_status_prod.lambda_handler"

  source_code_hash = filebase64sha256("${path.module}/get_status_prod/get_status_prod.zip")
  runtime          = "python3.11"
  filename         = "${path.module}/get_status_prod/get_status_prod.zip"

  environment {
    variables = {
      table_name = var.table_name
    }
  }
}

