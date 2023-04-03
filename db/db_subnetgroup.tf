data "aws_subnet_ids" "private_subnets" {
  vpc_id = data.aws_vpc.tech_vpc.id

  tags = {
    Name = "VisualpathTech-private_subnet"
  }
}

resource "aws_db_subnet_group" "psql_subnet_group" {
  name       = "psql-subnet"
  subnet_ids = data.aws_subnet_ids.private_subnets.ids

  tags = {
    Name = "VisualpathTech-psql"
  }
}