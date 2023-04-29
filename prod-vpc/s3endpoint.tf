resource "aws_vpc_endpoint" "s3_endpoint" {
  vpc_id       = aws_vpc.vpt_vpc.id
  service_name = "com.amazonaws.${var.aws_region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids = [aws_route_table.private_route_table.id]

  tags = merge(
    local.common_tags,
    {
      Name = "VisualpathProd-EP-S3"
    }
  )
}