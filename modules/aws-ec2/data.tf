data "aws_ami" "this" {
  most_recent = true

  filter {
    name   = "name"
    values = ["*${var.ec2_ami_name}*"]
  }

}
