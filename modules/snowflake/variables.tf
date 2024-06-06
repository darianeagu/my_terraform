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

variable "s3_bucket_name" {
  description = "Name of the S3 bucket for landing processed data"
  type        = string
}
