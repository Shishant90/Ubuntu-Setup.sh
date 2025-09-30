provider "aws" {
region = var.region
}

data "aws_ami" "ubuntu" {
most_recent = true
owners      = ["996353668644"]
filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
}
}

resource "aws_instance" "ec2_dev" {
ami           = data.aws_ami.ubuntu.id
instance_type = var.instance_type
key_name      = var.key_name
user_data     = file("${path.module}/cloud-init.yaml")
tags = { Name = "EC2-Ubuntu-Dev" }
}