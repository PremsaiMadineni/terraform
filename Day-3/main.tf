provider "aws" {
    region = "us-east01"
  
}

resource "aws_instance" "example" {
    ami = var.ami_value
    instance_type = var.instance_type_value
  
}