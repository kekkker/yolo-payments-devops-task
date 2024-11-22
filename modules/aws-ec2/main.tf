resource "aws_instance" "this" {
  subnet_id              = var.ec2_subnet_id
  vpc_security_group_ids = var.ec2_security_group_ids

  launch_template {
    id      = aws_launch_template.this.id
    version = aws_launch_template.this.latest_version
  }

  metadata_options {
    http_endpoint = var.http_endpoint
    http_tokens   = var.http_tokens
  }

  tags = var.tags
}
