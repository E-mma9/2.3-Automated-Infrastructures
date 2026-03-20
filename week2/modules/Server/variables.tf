variable "ami_id" {
  description = "AMI ID voor de EC2 instance )"
  type        = string
  default     = "ami-0c02fb55956c7d316"
}

variable "instance_name" {
  description = "Naam van de EC2 instance"
  type        = string
  default     = "main-instance"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "Subnet waar de instance geplaatst wordt"
  type        = string
}


variable "security_group_ids" {
  description = "Security Group ID gekoppeld aan de instance"
  type        = list(string)
  default     = []
}

variable "instance_count" {
  description = "Aantal instances om aan te maken"
  type        = number
  default     = 1
}

variable "key_name" {
  description = "Naam van het SSH key pair "
  type        = string
  default     = "Terraform"
}
