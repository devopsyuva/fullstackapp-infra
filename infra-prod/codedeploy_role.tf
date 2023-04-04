resource "aws_iam_role" "codedeploy_role" {
    name = var.codedeploy_role_name

    assume_role_policy = jsonencode({
      Version: "2012-10-17",
      Statement: [
        {
            Sid: "",
            Effect: "Allow",
            Principal: {
                Service: [
                    "codedeploy.amazonaws.com"
                ]
            },
            Action: "sts:AssumeRole"
        }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = aws_iam_role.codedeploy_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
}