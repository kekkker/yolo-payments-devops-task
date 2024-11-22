terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  # s3 backend commented out in order to save money :)
  #backend "s3" {
  #bucket                  = "ij-terraform-s3"
  #dynamodb_table          = "ij-terraform-dynamodb"
  #key    = "terraform"
  #region = "eu-central-1"
  #}
}

provider "aws" {
  region = "eu-central-1"
}
