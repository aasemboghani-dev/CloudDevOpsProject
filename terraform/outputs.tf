output "vpc_id" {
  description = "ID of the main VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_az1_id" {
  description = "ID of public subnet in AZ1"
  value       = aws_subnet.public_az1.id
}

output "public_subnet_az2_id" {
  description = "ID of public subnet in AZ2"
  value       = aws_subnet.public_az2.id
}

output "private_subnet_az1_id" {
  description = "ID of private subnet in AZ1"
  value       = aws_subnet.private_az1.id
}

output "private_subnet_az2_id" {
  description = "ID of private subnet in AZ2"
  value       = aws_subnet.private_az2.id
}

output "ec2_instance_id" {
  description = "ID of the DevOps EC2 instance"
  value       = aws_instance.devops.id
}

output "ec2_public_ip" {
  description = "Public IP of the DevOps EC2 instance"
  value       = aws_instance.devops.public_ip
}

output "nat_gateway_id" {
  description = "ID of the NAT Gateway"
  value       = aws_nat_gateway.main.id
}
