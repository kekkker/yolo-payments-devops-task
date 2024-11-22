**Yolo Payments DevOps Task**
==========================

**Overview**
------------

This project utilizes Terraform to provision infrastructure for a simple Nginx deployment on EC2. The setup includes:

* EC2 instance with a userdata
* SG with ingress and egress rules that allows port 80 and 22
* VPC with public and private subnets

**Prerequisites**
-----------------

### Requirements

* **Terraform**: `>= 1.5`.

**Terraform Modules**
---------------------

### 1. `aws-ec2`

#### Description
Manages EC2 instances with a custom launch template.

#### Variables

| Variable | Description |
| --- | --- |
| `ec2_ami_name` | The name of the AMI to use for the EC2 instance. |
| `ec2_instance_type` | The type of EC2 instance to launch. |
| `ec2_subnet_id` | The subnet ID where the instance will be launched. |
| `ec2_launch_template_name` | The name of the launch template to create. |
| `ec2_security_group_ids` | A list of security group IDs to associate with the EC2 instances. |
| `ec2_user_data` | User data for configuring instances, including a template name and variables. |

#### Outputs

* `eip`: The public IP of the EC2 instance.

### 2. `aws-sg`

#### Description
Creates SG with ingress and egress rules.

#### Variables

| Variable | Description |
| --- | --- |
| `sg_name` | The name of the security group. |
| `sg_vpc_id` | The ID of the VPC associated with the security group. |
| `sg_description` | The description of the security group. |
| `sg_ingress_rules` | Ingress rules for the security group. |
| `sg_egress_rules` | Egress rules for the security group. |

#### Outputs

* `sg_id`: The ID of the created Security Group.

### 3. `aws-vpc`

#### Description
Creates a Virtual Private Cloud (VPC) with public and private subnets.

#### Variables

| Variable | Description |
| --- | --- |
| `vpc_cidr_block` | **CIDR Block**: The CIDR block for the VPC. |
| `vpc_name` | **Name**: The name of the VPC (used as a tag). |
| `vpc_public_subnet_cidrs` | **Public Subnets**: A list of public subnet CIDR values. |
| `vpc_private_subnet_cidrs` | **Private Subnets**: A list of private subnet CIDR values. |
| `vpc_availability_zone` | **Availability Zone**: The name of the Availability Zone where the VPC and its subnets will be created.

#### Outputs

* `vpc_id`: The ID of the created VPC.
* `public_subnet_ids`: A list of public subnet IDs.
* `private_subnet_ids`: A list of private subnet IDs.

**Initializing and Applying Terraform Configuration**
---------------------------------------------------

1. **Navigate to the environment directory**:
```bash
cd ./environments/test
```
2. **Authenticate with AWS** (one of the following methods):
* **AWS CLI**: Run `aws configure` and follow the prompts.
* **Manual**: Set environment variables `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`.
3. **Initialize Terraform**:
```bash
terraform init
```
4. **Apply the Terraform configuration for the test environment**:
```bash
terraform apply
```

**AWS IAM Roles and Permissions**
----------------------------------

To apply this infrastructure, your AWS IAM role needs the following permissions:

* **EC2**:
+ `ec2:DescribeImages`
+ `ec2:RunInstances`
+ `ec2:AssociateIamInstanceProfile`
+ `ec2:CreateTags`

* **VPC**:
+ `ec2:DescribeVpcs`
+ `ec2:CreateSubnet`
+ `ec2:AssociateSubnet`
+ `ec2:CreateRouteTable`
+ `ec2:CreateInternetGateway`

* **Security Groups**:
+ `ec2:DescribeSecurityGroups`
+ `ec2:AuthorizeSecurityGroupIngress`
+ `ec2:AuthorizeSecurityGroupEgress`
