resource "aws_iam_instance_profile" "this" {
  role = var.ec2_iam_role

  tags = var.tags
}
