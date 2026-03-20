output "vpc_id" {
  description = "VPC ID van de test-omgeving"
  value       = module.vpc.vpc_id
}

output "instance_ids" {
  description = "Instance IDs"
  value       = module.Server.instance_ids
}

output "public_ips" {
  description = "Publieke IP adressen van de test-instances"
  value       = module.Server.public_ips
}
