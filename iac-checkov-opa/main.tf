terraform {
  required_version = ">= 1.0.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "insecure_bucket" {
  bucket = "my-insecure-bucket"

  acl    = "public-read"

  tags = {
    Name        = "Insecure S3 bucket"
    Environment = "Dev"
  }
}
