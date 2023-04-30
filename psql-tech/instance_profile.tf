resource "aws_iam_instance_profile" "psql_profile" {
  name = var.psql_profile_name
  role = aws_iam_role.psql_role.name
}