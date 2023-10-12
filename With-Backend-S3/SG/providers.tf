terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.34.0"
    }
  }

    backend "s3" {
    bucket = "terraform-state-files-versioned"
    dynamodb_table = "s3_state_lock"
    key    = "demo/resrefstatefile/terraform.tfstate"
    region = "ap-south-1"
    profile = "my-admin-profile"
#    encrypt = true
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
  profile = "my-admin-profile"
}