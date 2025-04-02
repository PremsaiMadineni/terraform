provider "aws" {
  region = "us-east-1"
}

provider "vault" {
  address = "54.90.215.25:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "526b34d6-8da9-410f-1a67-f93ce3a17e8c"
      secret_id = "f5d9601c-04ce-3d7f-ffe0-be806db6fec1"
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "kv" // change it according to your mount
  name  = "test-secret" // change it according to your secret
}

/*resource "aws_instance" "my_instance" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"

  tags = {
    Name = "test"
    Secret = data.vault_kv_secret_v2.example.data["foo"]
  }
}*/
