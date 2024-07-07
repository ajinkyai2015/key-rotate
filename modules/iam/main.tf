resource "aws_iam_role" "lambda_iam_role" {
  name = "lambda_iam_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_policy" "lambda_iam_policy" {
  name   = "lambda_iam_policy_${terraform.workspace}"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "iam:ListAccessKeys",
          "iam:CreateAccessKey",
          "iam:UpdateAccessKey",
          "iam:DeleteAccessKey",
        ],
        Effect   = "Allow",
        Resource = "*",
      },
      {
        Action   = "sns:Publish",
        Effect   = "Allow",
        Resource = "*",
      },
    ],
  })
}

resource "aws_iam_role_policy_attachment" "lambda_iam_policy_attachment" {
  role       = aws_iam_role.lambda_iam_role.name
  policy_arn = aws_iam_policy.lambda_iam_policy.arn
}


####################RO ONLY Role to Test ###########################

resource "aws_iam_role" "readonly" {
  name = "readonly-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "readonly_policy" {
  name       = "readonly-attachment"
  roles      = [aws_iam_role.readonly.name]
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_user" "readonly_user" {
  name = "readonly-user"
}

resource "aws_iam_access_key" "readonly_user_key" {
  user = aws_iam_user.readonly_user.name
}

resource "aws_secretsmanager_secret" "readonly_user_secret" {
  name = "readonly-user-credentials"
}

resource "aws_secretsmanager_secret_version" "readonly_user_secret_version" {
  secret_id     = aws_secretsmanager_secret.readonly_user_secret.id
  secret_string = jsonencode({
    AccessKeyId     = aws_iam_access_key.readonly_user_key.id
    SecretAccessKey = aws_iam_access_key.readonly_user_key.secret
  })
}
