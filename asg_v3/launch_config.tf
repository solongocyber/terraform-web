resource "aws_launch_configuration" "launch_conf_v3" {
  name_prefix   = replace(local.name, "rtype" , "lc_v3_new")
  image_id      = data.aws_ami.amazon_linux2.id
  instance_type = var.env == "dev" ? var.dev_instance_type : var.prod_instance_type
  key_name = aws_key_pair.public_key1.key_name
  security_groups = [aws_security_group.asg_sg.id]
  user_data = data.template_file.user_data.rendered

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_key_pair" "public_key1" {
  key_name   = "terraform_key1"
  public_key = file("~/.ssh/id_rsa.pub")

}
