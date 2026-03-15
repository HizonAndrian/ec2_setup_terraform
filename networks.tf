resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Terra_Ec2"
  }
}

resource "aws_subnet" "main_subnet" {
  for_each          = var.subnet_config
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.a_zone

  tags = {
    Name = each.key
  }
}

resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "main_igw"
  }
}

resource "aws_route_table" "main_route_tbl" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_igw.id
  }

  tags = {
    Name = "main_route_tbl"
  }
}

resource "aws_route_table_association" "main_route_tbl_assoc" {
  for_each       = local.public_subnet
  subnet_id      = aws_subnet.main_subnet[each.key].id
  route_table_id = aws_route_table.main_route_tbl.id
}