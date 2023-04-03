resource "aws_db_instance" "psql_instance" {
  allocated_storage       = var.min_storage
  max_allocated_storage   = var.max_storage
  db_name                 = var.db_instance_name
  engine                  = "postgres"
  engine_version          = "15.2"
  instance_class          = var.db_instance_type
  username                = "visualpathtech"
  password                = var.db_admin_password
  skip_final_snapshot     = true
  port                    = 5432
  vpc_security_group_ids  = [aws_security_group.psql_sg.id]
  availability_zone       = "${var.aws_region}a"
  network_type            = "IPV4"
  storage_type            = "gp3"
  apply_immediately       = true
  backup_retention_period = 3
  #backup_window           = "02:00-3:00"
  db_subnet_group_name    = aws_db_subnet_group.psql_subnet_group.name
}