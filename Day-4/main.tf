provider "aws" {
    region = "us-east-1"
  
}
resource "aws_instance" "premsai" {
    instance_type = "t2.micro"
    ami = "ami-084568db4383264d4"
    subnet_id = "subnet-088bb0089234b04ce"
  
}
resource "aws_s3_bucket" "s3_bucket" {
  bucket = "premsai-s3-demo-xyz" 
}

resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
