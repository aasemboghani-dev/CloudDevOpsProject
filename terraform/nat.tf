resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "cloud-devops-nat-eip"
  }
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_az1.id

  tags = {
    Name = "cloud-devops-nat"
  }

  depends_on = [aws_internet_gateway.main]
}