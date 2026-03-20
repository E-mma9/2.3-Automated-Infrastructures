output "security_group_ids" {
  description = "IDs van de aangemaakte Security Groups"
  value       = [aws_security_group.main.id]
}
