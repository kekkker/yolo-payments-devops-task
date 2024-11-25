module "sg" {
  source = "../../modules/aws-sg"

  sg_name        = "develop"
  sg_vpc_id      = module.vpc.vpc_id
  sg_description = "Develop SG"

  sg_ingress_rules = [{
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allowing 80 from everywhere"
    }, {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allowing 80 from everywhere"
  }]

  tags = var.tags
}
