output "vpc_id" {
  description = "VPC ID van de WordPress productie-omgeving"
  value       = module.vpc.vpc_id 
}

output "instance_ids" {
  description = "Instance IDs van de WordPress servers"
  value       = module.server.instance_ids
}

output "public_ips" {
  description = "Publieke IP adressen van de WordPress servers"
  value       = module.server.public_ips
}
