output "vpc_id" {
  description = "ID du VPC créé"
  value       = aws_vpc.main.id
}

output "igw_id" {
  description = "ID de l'Internet Gateway"
  value       = aws_internet_gateway.gw.id
}

output "public_subnets" {
  description = "IDs des sous-réseaux publics"
  value       = [aws_subnet.public_1.id, aws_subnet.public_2.id]
}

output "private_subnets" {
  description = "IDs des sous-réseaux privés"
  value       = [aws_subnet.private_1.id, aws_subnet.private_2.id]
}

output "nat_gateway_id" {
  description = "ID de la NAT Gateway"
  value       = aws_nat_gateway.nat.id
}