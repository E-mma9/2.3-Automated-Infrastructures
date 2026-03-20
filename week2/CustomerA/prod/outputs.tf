output "vpc_id" {
  description = "VPC ID van de productie-omgeving"
  value       = module.vpc.vpc_id
}

output "instance_ids" {
  description = "Instance IDs van de prod servers"
  value       = module.Server.instance_ids
}

output "public_ips" {
  description = "Publieke IP adressen van de prod-servers"
  value       = module.Server.public_ips
}
