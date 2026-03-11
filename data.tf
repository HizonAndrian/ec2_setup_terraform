data "aws_ami" "amzn_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name = "name"
    # Matches the standard AL2023 naming pattern
    values = ["al2023-ami-2023*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}