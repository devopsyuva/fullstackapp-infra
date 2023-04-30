resource "aws_iam_instance_profile" "app_profile" {
  name = var.app_profile_name
  role = aws_iam_role.app_role.name
}