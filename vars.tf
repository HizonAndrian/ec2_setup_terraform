variable "instance_config" {
  type = map(object({
    instance_type = string
    ami           = string
    a_zone        = string
    subnet        = string
  }))
}

variable "subnet_config" {
  type = map(object({
    cidr_block = string
    is_public  = bool
    a_zone     = string
  }))
}

variable "manual_ip" {
  type        = string
  description = "My own IP."
}