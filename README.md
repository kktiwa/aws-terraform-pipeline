# DSL Australia Terraform Pipeline

[![CircleCI](https://dl.circleci.com/status-badge/img/gh/twlabs/dsl-aus-terraform-pipeline/tree/main.svg?style=svg&circle-token=fee81a0dbfcdf8e234025c884ca3b80e3953c5e3)](https://dl.circleci.com/status-badge/redirect/gh/twlabs/dsl-aus-terraform-pipeline/tree/main)

This project is created for providing access to AWS DSL account via terraform.
This will be the main repository where all central assets such as team specific roles will be created.
Terraform code for project-specific resources will live inside separate repositories.

## Structure

Each folder in the terrafrom folder represents a module. 
These modules are supported by two separate `terragrunt.hcl` files. 
This is because the `account` module spans many regions (in order to lock down the default security groups) and the `roles` module is only `ap-southest-2`.

## Deploy
A deploy script `deploy_account.sh` is managing the `terragrunt apply` command for account and roles.