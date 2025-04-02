provider "aws" {
  region = "us-east-1"
}

provider "vault" {
  address = "http://54.90.162.9:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "1959a07f-2490-1e2d-0bbf-93b68cf245d3"
      secret_id = "cb18294f-f224-e5b5-c8b5-bd51effed10e"
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "kv" // change it according to your mount
  name  = "test-secret" // change it according to your secret
}

resource "aws_instance" "example" {
  ami           = "ami-084568db4383264d4"
  instance_type = "t2.micro"

  tags = {
    Name = "test"
    Secret = data.vault_kv_secret_v2.example.data["username"]
  }
}
