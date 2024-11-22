resource "aws_launch_template" "this" {
  name          = var.ec2_launch_template_name
  image_id      = data.aws_ami.this.id
  instance_type = var.ec2_instance_type

  iam_instance_profile {
    arn = aws_iam_instance_profile.this.arn
  }

  metadata_options {
    http_endpoint               = var.http_endpoint
    http_tokens                 = var.http_tokens
    http_put_response_hop_limit = var.http_hop_limit
  }

  user_data              = base64encode(templatefile(var.user_data.template_name, var.user_data.variables))
  vpc_security_group_ids = var.ec2_security_group_ids

  tags = var.tags
}
