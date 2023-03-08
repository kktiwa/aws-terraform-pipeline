This project is created for providing access to AWS accounts via terraform.
This will be the main repository where all central assets such as team specific roles will be created.
Terraform code for project-specific resources will live inside separate repositories.

## Structure

Each folder in the terraform folder represents a module. 
These modules are supported by two separate `terragrunt.hcl` files. 
This is because the `account` module spans many regions (in order to lock down the default security groups) and the `roles` module is only `ap-southest-2`.

## Deploy
A deploy script `deploy_account.sh` is managing the `terragrunt apply` command for account and roles.
