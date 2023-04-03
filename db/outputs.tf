output "psql_endpoint" {
  description = "PSQL enpoint to connect frontend application like NodeJS in VisualpathTech"
  value = aws_db_instance.psql_instance.endpoint
}

output "psql_username" {
  description = "PSQL username to login"
  value = aws_db_instance.psql_instance.username
}