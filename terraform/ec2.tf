resource "aws_instance" "devops" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  key_name = var.key_name

  subnet_id                   = aws_subnet.public_az1.id
  vpc_security_group_ids      = [aws_security_group.ec2.id]
  associate_public_ip_address = true

  root_block_device {
    encrypted = true
  }

  tags = {
    Name = "cloud-devops-ec2"
  }
}