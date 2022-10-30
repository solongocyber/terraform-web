terraform {
  backend "s3" {
    bucket = "aws-session-may2022-solongo"
    key    = "solongo/vpc_v3/terraform.tfstate"
    region = "us-east-2"
  }
}