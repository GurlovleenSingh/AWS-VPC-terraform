terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
# variable "aws_region" {
#     type = string
#     #default = "us-east-1"
#     description = "provide the aws region"
  
# }

# Configure the AWS Provider
provider "aws" {
  region =var.aws_region
}









