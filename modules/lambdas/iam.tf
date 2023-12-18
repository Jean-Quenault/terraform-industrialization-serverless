# getStatus IAM settings

resource "aws_iam_role" "get_status" {
  name = "get_status"
  description = "Role for get_status lambda"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        },
      },
    ],
  })
}

resource "aws_iam_policy" "get_status" {
  name        = "get_status"
  description = "Policy for get_status role only for checking connection to DynamoDB is ok"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "dynamodb:Scan"
        ],
        Effect = "Allow",
        Resource = var.dynamodb_arn
      },
    ],
  })
}

resource "aws_iam_role_policy_attachment" "get_status" {
  role       = aws_iam_role.get_status.name
  policy_arn = aws_iam_policy.get_status.arn
}

# getUsers IAM settings

# postUsers IAM settings