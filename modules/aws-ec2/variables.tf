variable "ec2_ami_name" {
  description = "The name of the AMI to use for the EC2 instance"
  type        = string
}

variable "ec2_instance_type" {
  description = "The type of EC2 instance to launch."
  type        = string
  default     = "t3.nano"
}

variable "ec2_subnet_id" {
  description = "A subnet ID where the instance will be launched."
  type        = string
}

variable "user_data" {
  description = "User data for configuring instances, including a template name and variables."
  type = object({
    template_name = string
    variables     = any
  })
  default = null
}

variable "ec2_iam_role" {
  description = "The IAM role to be associated with the EC2 instances."
  type        = string
  default     = null
}

variable "ec2_security_group_ids" {
  description = "A list of security group IDs to associate with the EC2 instances."
  type        = list(string)
  default     = []
}

variable "ec2_launch_template_name" {
  description = "Name of the launch template to be created"
  type        = string
}

variable "http_endpoint" {
  description = "Whether the metadata service has an HTTP endpoint."
  type        = string
  default     = "enabled"
}

variable "http_tokens" {
  description = "Whether the metadata service requires session tokens."
  type        = string
  default     = "required"
}

variable "http_hop_limit" {
  description = "Desired HTTP PUT response hop limit for instance metadata requests."
  type        = number
  default     = 1
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
