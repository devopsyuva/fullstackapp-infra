resource "aws_iam_role" "psql_role" {
  name = var.psql_role_name

  assume_role_policy = jsonencode({
    Version : "2012-10-17",
    Statement : [
      {
        Sid : "",
        Effect : "Allow",
        Principal : {
          Service : [
            "ec2.amazonaws.com"
          ]
        },
        Action : "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "Secrets_policy_attach" {
  role       = aws_iam_role.psql_role.name
  policy_arn = aws_iam_policy.psql_policy.arn
}