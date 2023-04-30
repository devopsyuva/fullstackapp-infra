data "aws_vpc" "prod_vpc" {
  tags = {
    Name = "Visualpath-Prod"
  }
}

data "aws_subnet_ids" "public_subnets" {
  vpc_id = data.aws_vpc.prod_vpc.id

  tags = {
    Name = "VisualpathProd-public_subnet"
  }
}

data "aws_subnet_ids" "private_subnets" {
  vpc_id = data.aws_vpc.prod_vpc.id

  tags = {
    Name = "VisualpathProd-private_subnet"
  }
}