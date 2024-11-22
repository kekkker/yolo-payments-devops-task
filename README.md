# Yolo payments devops task
## Objective
Use Terraform to deploy a basic infrastructure on AWS to host a simple web application.

1. VPC with two subnets (one public, one private).
2. An EC2 instance (Ubuntu) in the public subnet to serve as a web server.
3. A security group to allow HTTP (port 80) and SSH (port 22) access to the EC2 instance.
4. A public-facing Elastic IP attached to the EC2 instance.
5. A simple HTML file served using the web server on the EC2 instance (e.g., using Nginx or Apache).

## Must have:
Provide clear instructions on how to initialize and apply the Terraform configuration.
Document any AWS IAM roles or permissions needed to apply the infrastructure.

Terraform code (main.tf, variables.tf, and outputs.tf files).
A README file with steps to run the Terraform code.
A brief description of the solution.
