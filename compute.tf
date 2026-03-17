resource "aws_instance" "ec2_instance_main" {
  for_each      = var.instance_config
  instance_type = each.value.instance_type
  ami           = local.amis[each.value.ami]

  availability_zone           = each.value.a_zone
  subnet_id                   = aws_subnet.main_subnet[each.value.subnet].id
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  associate_public_ip_address = true

  # IAM Role
  key_name  = aws_key_pair.main_kp.key_name

  # User data 
  user_data = file("${path.module}/bootstrap.sh")

  tags = {
    Name = each.key
  }
}

resource "aws_key_pair" "main_kp" {
  # Key pair generator
  # ssh-keygen -t rsa -b 4096 -f main_kp
  key_name   = "main_kp"
  public_key = file("${path.module}/main_kp.pub")
}