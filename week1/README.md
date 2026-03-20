# Week 1 - AWS Basic Infrastructure with Terraform

## Project goal
This project deploys a basic AWS infrastructure environment using Terraform.

## Resources created
- 1 VPC
- 1 public subnet
- 1 Internet Gateway
- 1 route table with internet access
- 1 route table association
- 1 security group
- 1 EC2 instance

## Architecture
The EC2 instance is deployed inside a public subnet in the VPC.  
The subnet is connected to the internet through an Internet Gateway and a public route table.  
The security group allows SSH, HTTP, and HTTPS access.

## Files
- `main.tf` - main infrastructure resources
- `README.md` - project documentation

## Requirements
- Terraform installed
- AWS account
- AWS credentials configured
- Existing AWS key pair

## How to use
```bash
terraform init
terraform plan
terraform apply
