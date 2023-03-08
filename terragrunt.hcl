remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    encrypt = true
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "aus-dsl-terraform-state"
    role_arn = "arn:aws:iam::134515227809:role/terraform-deploy-role"
    key = "${path_relative_to_include()}/roles/terraform.tfstate"
    region         = "ap-southeast-2"
  }
}

generate provider {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  provider "aws" {
      region = var.region
      assume_role {
        role_arn = "arn:aws:iam::134515227809:role/terraform-deploy-role"
      }
  }
  EOF

}


terraform {
    source = "./"
}