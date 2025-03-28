
provider "aws" {
    region = "us-east-1"
  
}

variable "ami" {
    description = "this AMI for instances"
  
}
variable "instance_type" {
    description = "this is the instance type for example, : t2.micro"
  
}

resource "aws_instance" "example" {
    ami = var.ami
    instance_type = var.instance_type
  
}
