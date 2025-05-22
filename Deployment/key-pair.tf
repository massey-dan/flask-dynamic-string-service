resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = file("C:/Users/DMass/.ssh/id_rsa.pub")
}
