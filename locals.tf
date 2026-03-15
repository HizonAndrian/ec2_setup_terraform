# EC2 AMIS
locals {
  amis = {
    amzn_linux = "${data.aws_ami.amzn_linux_2023.id}",
    ubuntu     = "${data.aws_ami.ubuntu.id}"
  }
}

locals {
  public_subnet = {
    for key, value in var.subnet_config :
    key => value
    if value.is_public == true
  }
}