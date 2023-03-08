#!/bin/bash
set -e

TARGET_REGIONS=("us-east-1" "us-east-2" "us-west-1" "us-west-2" "ap-south-1" "ap-northeast-3" "ap-northeast-2" "ap-southeast-1" "ap-southeast-2" "ap-northeast-1" "ca-central-1" "eu-central-1" "eu-west-1" "eu-west-2" "eu-west-3" "eu-north-1" "sa-east-1")

run_terragrunt()
{
  terragrunt init -reconfigure -upgrade
  terragrunt apply -auto-approve
}

echo "Start applying accounts"
cd account
for target_region in "${TARGET_REGIONS[@]}"; do
    echo "Deploying to region ${target_region}"
    export REGION="${target_region}"
    run_terragrunt

done
echo "Completed applying accounts"

cd ../

echo "Start applying roles"
cd roles
run_terragrunt
echo "Completed applying accounts"