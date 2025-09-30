variable "region" {
default = "us-east-1"
}

variable "instance_type" {
default = "t2.micro"
}

variable "key_name" {
default = "amzone-mcp-.pem"  # replace with your AWS key pair name
}