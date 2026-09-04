resource "aws_kms_key" "s3" {
  description             = "KMS key for Cloud DevOps S3 encryption"
  deletion_window_in_days = 7
  enable_key_rotation     = true

  tags = {
    Name = "cloud-devops-s3-kms"
  }
}

resource "aws_kms_alias" "s3" {
  name          = "alias/cloud-devops-s3"
  target_key_id = aws_kms_key.s3.key_id
}