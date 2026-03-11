resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/26"

  tags = {
    Name = "Terra_Ec2"
  }
}

# resource "aws_subnet" "" {

# }