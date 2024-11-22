module "vpc" {
  source = "../../modules/aws-vpc"

  vpc_name = "develop"
}
