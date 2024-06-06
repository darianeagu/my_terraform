resource "snowflake_database" "this" {
  name    = var.snowflake_database
  comment = "Database for storing processed data"
}

resource "snowflake_schema" "this" {
  database = snowflake_database.this.name
  name     = var.snowflake_schema
  comment  = "Schema for processed data"
}

resource "snowflake_table" "this" {
  database = snowflake_database.this.name
  schema   = snowflake_schema.this.name
  name     = var.snowflake_table
  comment  = "Table for storing robot events data"

  column {
    name = "meta_orb_site"
    type = "STRING"
  }

  column {
    name = "meta_machine_name"
    type = "STRING"
  }

  column {
    name = "meta_event_time"
    type = "STRING"
  }
}

resource "snowflake_stage" "this" {
  name      = var.snowflake_stage_name
  database  = snowflake_database.this.name
  schema    = snowflake_schema.this.name
  url       = "s3://${var.s3_bucket_name}"
  comment   = "Stage for loading data from S3 to Snowflake"
  file_format = snowflake_file_format.this.name
}

resource "snowflake_file_format" "this" {
  name       = var.snowflake_file_format_name
  database   = snowflake_database.this.name
  schema     = snowflake_schema.this.name
  format_type = "CSV"
  csv_compression = "GZIP"
}

resource "snowflake_pipe" "this" {
  name      = var.snowpipe_name
  database  = snowflake_database.this.name
  schema    = snowflake_schema.this.name
  stage     = snowflake_stage.this.name
  copy_statement = <<-EOT
    COPY INTO ${snowflake_database.this.name}.${snowflake_schema.this.name}.${snowflake_table.this.name}
    FROM @${snowflake_stage.this.name}
    FILE_FORMAT = (FORMAT_NAME = ${snowflake_file_format.this.name})
    ON_ERROR = 'CONTINUE';
  EOT
}

