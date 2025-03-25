provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  ami_value = "ami-084568db4383264d4" # replace this
  instance_type_value = "t2.micro"
  subnet_id_value = "subnet-088bb0089234b04ce". # replace this
}
