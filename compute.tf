resource "aws_instance" "ec2_instance_main" {
  ami           = data.aws_ami.amzn_linux_2023.id
  instance_type = "t3.micro"

  tags = {
    Name = "Terraform_project"
  }
}