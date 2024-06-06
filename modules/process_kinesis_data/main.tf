resource "aws_glue_job" "glue_job" {
  name     = var.glue_job_name
  role_arn = var.iam_role_arn

  command {
    name            = "glueetl"
    script_location = var.script_location
  }

  default_arguments = {
    "--TempDir"        = "s3://aws-glue-temporary-${var.glue_job_name}"
    "--job-bookmark-option" = "job-bookmark-enable"
    "--enable-metrics" = "true"
    "--enable-continuous-logging" = "true"
  }

  connections = [var.connection_name]

  glue_version     = "2.0"
  number_of_workers = var.number_of_workers
  worker_type      = var.worker_type
}

resource "aws_glue_trigger" "on_demand_trigger" {
  name     = "${var.glue_job_name}_trigger"
  type     = "ON_DEMAND"
  actions {
    job_name = aws_glue_job.this.name
  }
}
