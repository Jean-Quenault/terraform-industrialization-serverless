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
          "dynamodb:Scan",
          "dynamodb:Query"
        ],
        Effect = "Allow",
        Resource = var.dynamodb_arn
      },
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Effect = "Allow",
        Resource = "arn:aws:logs:*:*:*"
      }
    ],
  })
}

resource "aws_iam_role_policy_attachment" "get_status" {
  role       = aws_iam_role.get_status.name
  policy_arn = aws_iam_policy.get_status.arn
}










# getUsers IAM settings

resource "aws_iam_role" "get_users" {
  name = "get_users"
  description = "Role for get_users lambda"

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

resource "aws_iam_policy" "get_users" {
  name        = "get_users"
  description = "Policy for get_users role to connect to DynamoDB and to read data inside"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "dynamodb:DescribeTable",
          "dynamodb:GetItem",
          "dynamodb:Query",
          "dynamodb:Scan",
          "dynamodb:BatchGetItem"
        ],
        Effect = "Allow",
        Resource = var.dynamodb_arn
      },
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Effect = "Allow",
        Resource = "arn:aws:logs:*:*:*"
      }
    ],
  })
}

resource "aws_iam_role_policy_attachment" "get_users" {
  role       = aws_iam_role.get_users.name
  policy_arn = aws_iam_policy.get_users.arn
}








# postUsers IAM settings

resource "aws_iam_role" "post_users" {
  name = "post_users"
  description = "Role for post_users lambda"

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

resource "aws_iam_policy" "post_users" {
  name        = "post_users"
  description = "Policy for post_users role to connect to DynamoDB and to write data inside"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "dynamodb:PutItem",
          "dynamodb:UpdateItem",
          "dynamodb:BatchWriteItem"
        ],
        Effect = "Allow",
        Resource = var.dynamodb_arn
      },
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Effect = "Allow",
        Resource = "arn:aws:logs:*:*:*"
      }
    ],
  })
}

resource "aws_iam_role_policy_attachment" "post_users" {
  role       = aws_iam_role.post_users.name
  policy_arn = aws_iam_policy.post_users.arn
}
