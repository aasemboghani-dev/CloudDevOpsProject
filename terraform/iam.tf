resource "aws_iam_role" "ec2_role" {
  name = "cloud-devops-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "cloud-devops-ec2-role"
  }
}


resource "aws_iam_instance_profile" "ec2_profile" {
  name = "cloud-devops-ec2-profile"
  role = aws_iam_role.ec2_role.name
}


resource "aws_iam_role_policy" "ec2_ecr" {
  name = "cloud-devops-ec2-ecr-push"
  role = aws_iam_role.ec2_role.id

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect   = "Allow"
        Action   = "ecr:GetAuthorizationToken"
        Resource = "*"
      },
      {
        Effect = "Allow"

        Action = [
          "ecr:BatchCheckLayerAvailability",
          "ecr:CompleteLayerUpload",
          "ecr:InitiateLayerUpload",
          "ecr:PutImage",
          "ecr:UploadLayerPart",
          "ecr:BatchGetImage"
        ]

        Resource = aws_ecr_repository.app.arn
      }
    ]
  })
}