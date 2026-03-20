variable "vpc_cidr" {
  description = "CIDR block voor de VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block voor het publieke subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "vpc_name" {
  description = "Naam van de VPC"
  type        = string
  default     = "main-vpc"
}

variable "subnet_name" {
  description = "Naam van het subnet"
  type        = string
  default     = "main-subnet"
}


