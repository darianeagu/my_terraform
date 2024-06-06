// assuming an existing Virtual Private Cloud
// and a simple set of public and private subnets
// I neglected to include all of the additional assets for time and celerity

// here is an example of how I would declare two airflow instances
// all other modules are defined below

module "airflow_prod" {
  source     = "./modules/airflow"
  name       = "production-airflow"
  region     = "eu-west-2"
  ami_id     = "ami-0abcdef1234567890"  // replace with an actual AMI ID
  instance_type = "t2.medium"  // add other required variables as well
}

module "airflow_dev" {
  source     = "./modules/airflow"
  name       = "dev-airflow"
  region     = "eu-west-2"
  ami_id     = "ami-0abcdef1234567890"  // replace with an actual AMI ID
  instance_type = "t2.medium"  // add other required variables as well
}

module "kinesis_stream" {
  source              = "./modules/kinesis_stream"
  stream_name         = var.kinesis_stream_name
  shard_count         = var.shard_count
  retention_period    = var.retention_period
  shard_level_metrics = var.shard_level_metrics
  environment         = var.environment
}

module "s3_landing_bucket" {
  source      = "./modules/s3_landing_bucket"
  bucket_name = var.landing_bucket_name
  environment = var.environment
  s3_bucket_name = "data-landing"
}

module "process_kinesis_data" {
  source            = "./modules/process_kinesis_data"
  glue_job_name     = var.glue_job_name
  script_location   = var.script_location
  iam_role_arn      = var.iam_role_arn
  connection_name   = var.connection_name
  number_of_workers = var.number_of_workers
  worker_type       = var.worker_type
}

module "snowflake" {
  source                      = "./modules/snowflake"
  snowflake_database          = var.snowflake_database
  snowflake_schema            = var.snowflake_schema
  snowflake_table             = var.snowflake_table
  snowflake_stage_name        = var.snowflake_stage_name
  snowflake_file_format_name  = var.snowflake_file_format_name
  snowpipe_name               = var.snowpipe_name
  s3_bucket_name              = var.s3_bucket_name
}
