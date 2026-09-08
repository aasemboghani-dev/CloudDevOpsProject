variable "vpc_cidr" {
  type = string
}

resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "cloud-devops-vpc"
  }
}

output "vpc_id" {
  value = aws_vpc.this.id
}