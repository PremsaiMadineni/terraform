terraform {
  backend "s3" {
    bucket         = "premsai-s3-demo-xyz"
    key            = "premsai/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
