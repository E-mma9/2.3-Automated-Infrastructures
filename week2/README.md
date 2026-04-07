# Week 2 - Modular Terraform Infrastructure

## What is this week about?

In Week 1, all the infrastructure code was written in one file with hardcoded values.  
This week the code is refactored into **modules** so it can be reused for different customers.  
Instead of copying code for every customer, you call the same module with different values. 

Three modules were created:
- **VPC** - creates the network
- **SecurityGroup** - creates the firewall rules
- **Server** - creates the EC2 instances 

## Folder structure

```text
.
├── Modules/
│   ├── VPC/
│   ├── SecurityGroup/
│   └── Server/
├── klantA/
│   ├── test/
│   └── prod/
├── klantB/
│   └── prod/
└── klantC/
```

Each module has three files:
- `main.tf` - the actual resources
- `variables.tf` - the inputs you can change
- `outputs.tf` - the values shown after deployment 

## Modules

### VPC module

Creates a VPC with a public subnet and internet access. 

What it creates:
- A VPC
- A public subnet
- An Internet Gateway
- A route table so instances can reach the internet 

Variables:
- `vpc_cidr` - IP range of the VPC
- `subnet_cidr` - IP range of the subnet
- `vpc_name` - name of the VPC
- `subnet_name` - name of the subnet 

Outputs:
- `vpc_id`
- `subnet_id`

### SecurityGroup module

Creates a security group that allows SSH and HTTP traffic. 

What it creates:
- A security group with port 22 open for SSH
- A security group with port 80 open for HTTP
- All outgoing traffic is allowed 

Variables:
- `vpc_id`
- `sg_name`
- `sg_description` 

Output:
- `security_group_ids` 

### Server module

Creates one or more EC2 instances.  
This module uses `instance_count`, so it can be used for both test and production. 

Variables:
- `ami_id`
- `instance_name`
- `instance_type`
- `subnet_id`
- `security_group_ids`
- `instance_count`
- `key_name` 

Outputs:
- `instance_ids`
- `public_ips`

## Example: klantB production

For `klantB/prod`, the modules are used to create a production environment.  
This environment uses a VPC with CIDR `10.2.0.0/16`, a subnet with CIDR `10.2.1.0/24`, and 3 EC2 instances of type `t2.small`. 

The outputs show:
- The VPC ID
- The instance IDs
- The public IP addresses of the servers 

## How to use

Go to a customer folder, for example:

```bash
cd klantB/prod
```

Then run:

```bash
terraform init
terraform plan
terraform apply
terraform destroy
```

These commands initialize Terraform, show the deployment plan, create the resources, and remove them again for testing. 

## What I learned

In this week I learned how to split Terraform code into reusable modules.
I also learned how to use variables and outputs to make the code cleaner and easier to reuse for multiple customers. 
