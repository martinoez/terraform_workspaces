
provider "aws" {
    region ="ca-central-1"
}

resource "aws_instance" "example" {
    ami = "ami-06873c81b882339ac"
    instance_type = "t2.micro"
}

terraform {
  backend "s3" {
    bucket = "terraform-up-and-running-state-martinkonak"
    key = "workspaces-example/terraform.tfstate"
    region = "ca-central-1"

    dynamodb_table = "terraform-up-and-running-locks"
    encrypt = true
  }
}