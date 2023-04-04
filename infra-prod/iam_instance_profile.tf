resource "aws_iam_role" "instanceprofile_role" {
  name = var.instance_profile_role

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

resource "aws_iam_policy" "instance_policy" {
  name        = var.instance_profile_policy
  path        = "/"
  description = "VisualpathTech Instance profile"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:Get*",
          "s3:List*"
        ],
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "profile_attach" {
  role       = aws_iam_role.instanceprofile_role.name
  policy_arn = aws_iam_policy.instance_policy.arn
}

resource "aws_iam_instance_profile" "tech_profile" {
  name = var.instance_profile
  role = aws_iam_role.instanceprofile_role.name
}