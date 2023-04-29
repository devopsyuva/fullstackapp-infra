resource "aws_internet_gateway" "prod_igw" {
  vpc_id = aws_vpc.vpt_vpc.id

  tags = merge(
    local.common_tags,
    {
      Name = "VisualpathProd-igw"
    }
  )
}