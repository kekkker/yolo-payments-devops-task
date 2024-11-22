variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"

  description = "CIDR Block of the VPC"
}

variable "vpc_name" {
  type = string

  description = "Name of the VPC to be cretated (tag)"
}

variable "vpc_public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
  default     = ["10.0.1.0/24"]
}

variable "vpc_private_subnet_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDR values"
  default     = ["10.0.4.0/24"]
}

variable "vpc_availability_zone" {
  type        = string
  description = "Name of the Availabilty zone where VPC and it's subnets will be created."
  default     = "eu-central-1"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
