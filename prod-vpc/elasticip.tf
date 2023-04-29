resource "aws_eip" "prod_eip" {
  vpc = true

  tags = merge(
    local.common_tags,
    {
      Name = "VisualpathProd-eip"
    }
  )
}