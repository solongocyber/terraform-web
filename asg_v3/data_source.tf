data "aws_ami" "amazon_linux2" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

data "terraform_remote_state" "vpc_v3" {
  backend = "s3"
  config = {
    bucket = "aws-session-may2022-solongo"
    key    = "solongo/vpc_v3/terraform.tfstate"
    region = "us-east-2"
  }
}

data "terraform_remote_state" "alb_tg" {
backend = "s3" 
config  =  {
    bucket = "aws-session-may2022-solongo"
    key    = "solongo/aws_alb_v2/terraform.tfstate"
    region = "us-east-2"
  }


}

data "template_file" "user_data"{
  template = file("user_data.sh")
    
  vars = {
      environment = var.env
    }
  }