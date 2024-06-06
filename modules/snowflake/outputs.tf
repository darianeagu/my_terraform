output "snowflake_stage_name" {
  description = "The name of the Snowflake stage"
  value       = snowflake_stage.this.name
}

output "snowflake_stage_url" {
  description = "The URL of the Snowflake stage"
  value       = snowflake_stage.this.url
}

output "snowpipe_name" {
  description = "The name of the Snowpipe"
  value       = snowflake_pipe.this.name
}

output "database_name" {
  value = snowflake_database.this.name
}

output "schema_name" {
  value = snowflake_schema.this.name
}

output "table_name" {
  value = snowflake_table.this.name
}

output "file_format_name" {
  value = snowflake_file_format.this.name
}
