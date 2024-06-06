output "glue_job_name" {
  description = "The name of the Glue job"
  value       = aws_glue_job.this.name
}

output "glue_job_arn" {
  description = "The ARN of the Glue job"
  value       = aws_glue_job.this.arn
}

output "glue_trigger_name" {
  description = "The name of the Glue job trigger"
  value       = aws_glue_trigger.on_demand_trigger.name
}
