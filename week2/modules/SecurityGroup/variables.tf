variable "vpc_id" {
  description = "ID van de VPC waar de security group aan gekoppeld wordt"
  type        = string
}

variable "sg_name" {
  description = "Naam van de security group"
  type        = string
  default     = "main-sg"
}

variable "sg_description" {
  description = "Beschrijving van de security group"
  type        = string
  default     = "Security group"
}

