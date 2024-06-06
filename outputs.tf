# Airflow Outputs
output "airflow_instance_id" {
  description = "The ID of the Airflow instance"
  value       = module.airflow_prod.airflow_instance_id
}

output "airflow_instance_public_ip" {
  description = "The public IP of the Airflow instance"
  value       = module.airflow_prod.airflow_instance_public_ip
}

output "airflow_dev_instance_id" {
  description = "The ID of the Airflow instance (dev)"
  value       = module.airflow_dev.airflow_instance_id
}

output "airflow_dev_instance_public_ip" {
  description = "The public IP of the Airflow instance (dev)"
  value       = module.airflow_dev.airflow_instance_public_ip
}

# Kinesis Stream Outputs
output "stream_name" {
  description = "The name of the Kinesis stream"
  value       = module.kinesis_stream.stream_name
}

output "stream_arn" {
  description = "The ARN of the Kinesis stream"
  value       = module.kinesis_stream.stream_arn
}

output "stream_id" {
  description = "The ID of the Kinesis stream"
  value       = module.kinesis_stream.stream_id
}

# Glue Job Outputs
output "glue_job_name" {
  description = "The name of the Glue job"
  value       = module.process_kinesis_data.glue_job_name
}

output "glue_job_arn" {
  description = "The ARN of the Glue job"
  value       = module.process_kinesis_data.glue_job_arn
}

output "glue_trigger_name" {
  description = "The name of the Glue job trigger"
  value       = module.process_kinesis_data.glue_trigger_name
}

# S3 Landing Bucket Outputs
output "bucket_id" {
  description = "The ID of the S3 bucket"
  value       = module.s3_landing_bucket.bucket_id
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = module.s3_landing_bucket.bucket_arn
}

output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = module.s3_landing_bucket.bucket_name
}

output "bucket_region" {
  description = "The AWS region where the S3 bucket is created"
  value       = module.s3_landing_bucket.bucket_region
}

# Snowflake Outputs
output "snowflake_stage_name" {
  description = "The name of the Snowflake stage"
  value       = module.snowflake.snowflake_stage_name
}

output "snowflake_stage_url" {
  description = "The URL of the Snowflake stage"
  value       = module.snowflake.snowflake_stage_url
}

output "snowpipe_name" {
  description = "The name of the Snowpipe"
  value       = module.snowflake.snowpipe_name
}

output "database_name" {
  description = "The name of the Snowflake database"
  value       = module.snowflake.database_name
}

output "schema_name" {
  description = "The name of the Snowflake schema"
  value       = module.snowflake.schema_name
}

output "table_name" {
  description = "The name of the Snowflake table"
  value       = module.snowflake.table_name
}

output "file_format_name" {
  description = "The name of the Snowflake file format"
  value       = module.snowflake.file_format_name
}
