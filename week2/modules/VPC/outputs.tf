output "vpc_id" {
    description = "ID van VPC"
    value = aws_vpc.main.id
}

output "subnet_id" {
    description = "Id van subnet"
    value = aws_subnet.public.id
}
