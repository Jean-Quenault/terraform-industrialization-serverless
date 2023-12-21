resource "aws_lambda_function" "getStatusProd" {
  function_name = "getStatusProd"
  role          = aws_iam_role.get_status_prod.arn
  handler       = "lambda_function.lambda_handler"

  source_code_hash = filebase64sha256("${path.module}/get_status_prod/get_status_prod.zip")
  runtime          = "python3.11"
  filename         = "${path.module}/get_status_prod/get_status_prod.zip"

  environment {
    variables = {
      TABLE_NAME = var.table_name
    }
  }
}

