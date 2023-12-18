resource "aws_lambda_function" "getStatus" {
  function_name = "getStatus"
  role          = aws_iam_role.lambda_dynamodb_role.arn
  handler       = "lambda_function.lambda_handler"

  source_code_hash = filebase64sha256("get_status/get_status.zip")
  runtime          = "python3.11"
  filename         = "get_status/get_status.zip"

  environment {
    variables = {
      TABLE_NAME = var.table_name
    }
  }
}