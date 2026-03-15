resource "aws_instance" "ec2_instance_main" {
  for_each      = var.instance_config
  instance_type = each.value.instance_type
  ami           = local.amis[each.value.ami]

  availability_zone           = each.value.a_zone
  subnet_id                   = aws_subnet.main_subnet[each.value.subnet].id
  associate_public_ip_address = true

  # IAM Role
  key_name = aws_key_pair.main_kp.key_name

  tags = {
    Name = each.key
  }
}

resource "aws_key_pair" "main_kp" {
  key_name = "main_kp"
  public_key = file("${path.module}/my-devops-key.pub")
}