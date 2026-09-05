resource "aws_db_subnet_group" "main" {
  name = "cloud-devops-db-subnet-group"

  subnet_ids = [
    aws_subnet.private_az1.id,
    aws_subnet.private_az2.id
  ]

  tags = {
    Name = "cloud-devops-db-subnet-group"
  }
}

resource "aws_security_group" "rds" {
  name        = "cloud-devops-rds-sg"
  description = "Security group for Cloud DevOps RDS"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "MySQL from EC2"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.ec2.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "cloud-devops-rds-sg"
  }
}

resource "aws_db_instance" "main" {
  identifier = "cloud-devops-db"

  engine         = "mysql"
  engine_version = "8.0"

  instance_class        = "db.t3.micro"
  allocated_storage     = 20
  max_allocated_storage = 50
  storage_type          = "gp3"
  storage_encrypted     = true

  db_name  = "clouddevops"
  username = "cloudadmin"
  password = "CloudDevOps2026Pass"

  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds.id]

  publicly_accessible = false

  backup_retention_period = 0
  skip_final_snapshot     = true

  tags = {
    Name = "cloud-devops-rds"
  }
}
