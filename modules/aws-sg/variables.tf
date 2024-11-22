variable "sg_name" {
  description = "The name of the security group."
  type        = string
}

variable "sg_vpc_id" {
  description = "The ID of the VPC associated with the security group."
  type        = string
}

variable "sg_description" {
  description = "The description of the security group."
  type        = string
  default     = ""
}

variable "sg_ingress_rules" {
  description = "Ingress rules for the security group."
  type = list(object({
    from_port       = number
    to_port         = number
    protocol        = string
    cidr_blocks     = list(string)
    description     = string
    security_groups = optional(list(string))
  }))
  default = [
    {
      from_port       = 80
      to_port         = 80
      protocol        = "tcp"
      cidr_blocks     = ["10.0.0.0/8"]
      description     = "Allow port 80"
      security_groups = []
    },
  ]
}

variable "sg_egress_rules" {
  description = "Egress rules for the security group."
  type = list(object({
    from_port       = number
    to_port         = number
    protocol        = string
    cidr_blocks     = list(string)
    description     = string
    security_groups = optional(list(string))
  }))
  default = [
    {
      from_port       = 0
      to_port         = 0
      protocol        = "-1"
      cidr_blocks     = ["0.0.0.0/0"]
      description     = "Allow all"
      security_groups = []
    }
  ]
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
