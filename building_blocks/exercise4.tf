terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Actively managed by us, by our Terraform project
resource "aws_s3_bucket" "test_bucket" {
  bucket = var.bucket_name
}

# Managed somewhere else, we just want to use in our project
data "aws_s3_bucket" "my_external_bucket" {
  bucket = "my-external-bucket-1234567890"
}

variable "bucket_name" {
  type        = string
  description = "value of the bucket name"
  default     = "my-test-bucket-1234567890"

}

output "bucket_id" {
  value = aws_s3_bucket.test_bucket.id
}

locals {
  my_local_variable = "This is a local variable"
}

module "my_module" {
  source             = "./my_module"
  my_module_variable = "This is a module variable"

}
