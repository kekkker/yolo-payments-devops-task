module "ec2" {
  source = "../../modules/aws-ec2"

  ec2_ami_name = "ubuntu-minimal/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-minimal-20241012"

  ec2_subnet_id            = module.vpc.public_subnet_ids[0]
  ec2_launch_template_name = "develop"
  ec2_security_group_ids   = [module.sg.sg_id]

  user_data = {
    template_name = "ec2.tmpl"
    variables     = {}
  }
}
