# General Variables
variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "environment" {
  description = "Deployment environment (e.g., dev, prod)"
  type        = string
}

# Airflow Variables
variable "ami_id" {
  description = "AMI ID for the Airflow instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.medium"
}

variable "name" {
  description = "A unique name for the Airflow instance"
  type        = string
}

# Kinesis Stream Variables
variable "kinesis_stream_name" {
  description = "The name of the Kinesis stream"
  type        = string
}

variable "shard_count" {
  description = "The number of shards that the stream will use"
  type        = number
  default     = 1
}

variable "retention_period" {
  description = "The length of time data records are accessible after they are added to the stream"
  type        = number
  default     = 24
}

variable "shard_level_metrics" {
  description = "A list of shard-level CloudWatch metrics to enable for the stream"
  type        = list(string)
  default     = []
}

# Glue Job Variables
variable "glue_job_name" {
  description = "The name of the Glue job"
  type        = string
}

variable "script_location" {
  description = "The S3 location of the Glue job script"
  type        = string
}

variable "iam_role_arn" {
  description = "The IAM role ARN for the Glue job"
  type        = string
}

variable "connection_name" {
  description = "The name of the Glue connection"
  type        = string
  default     = ""
}

variable "number_of_workers" {
  description = "The number of workers of a defined workerType that are allocated to the job"
  type        = number
  default     = 10
}

variable "worker_type" {
  description = "The type of predefined worker that is allocated when a job runs. Accepts Standard, G.1X, or G.2X"
  type        = string
  default     = "Standard"
}

# S3 Landing Bucket Variables
variable "s3_bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

# Snowflake Variables
variable "snowflake_database" {
  description = "Snowflake database name"
  type        = string
}

variable "snowflake_schema" {
  description = "Snowflake schema name"
  type        = string
}

variable "snowflake_table" {
  description = "Snowflake table name"
  type        = string
}

variable "snowflake_stage_name" {
  description = "Name of the Snowflake stage"
  type        = string
}

variable "snowflake_file_format_name" {
  description = "Name of the Snowflake file format"
  type        = string
}

variable "snowpipe_name" {
  description = "Name of the Snowpipe"
  type        = string
}

