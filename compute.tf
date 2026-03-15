resource "aws_instance" "ec2_instance_main" {
  for_each          = var.instance_config
  instance_type     = each.value.instance_type
  ami               = local.amis[each.value.ami]
  availability_zone = each.value.a_zone

  subnet_id = aws_subnet.main_subnet[each.value.subnet].id

  tags = {
    Name = each.key
  }
}