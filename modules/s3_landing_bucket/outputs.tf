output "bucket_id" {
  description = "The ID of the S3 bucket"
  value       = aws_s3_bucket.landing_bucket.id
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.landing_bucket.arn
}

output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.landing_bucket.bucket
}

output "bucket_region" {
  description = "The AWS region where the S3 bucket is created"
  value       = var.region
}
