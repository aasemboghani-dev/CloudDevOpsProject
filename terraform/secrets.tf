resource "aws_secretsmanager_secret" "rds" {
  name = "cloud-devops-rds-credentials"

  tags = {
    Name = "cloud-devops-rds-credentials"
  }
}

resource "aws_secretsmanager_secret_version" "rds" {
  secret_id = aws_secretsmanager_secret.rds.id

  secret_string = jsonencode({
    username = "cloudadmin"
    password = "CloudDevOps2026Pass"
  })
}