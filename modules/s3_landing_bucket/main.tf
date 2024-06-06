provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "landing_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}

resource "aws_s3_bucket_public_access_block" "landing_bucket_public_access_block" {
  bucket = aws_s3_bucket.landing_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
