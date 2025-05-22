resource "aws_subnet" "sub1" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = var.vpc-cidr
  availability_zone       = var.subnet_az
  map_public_ip_on_launch = true
}