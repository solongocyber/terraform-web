terraform {
  backend "s3" {
    bucket = "aws-session-may2022-solongo"
    key    = "solongo/asg_v3/terraform.tfstate"
    region = "us-east-2"
  }
}
