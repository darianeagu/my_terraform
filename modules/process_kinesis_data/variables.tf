variable "glue_job_name" {
  description = "The name of the Glue job"
  type        = string
}

variable "script_location" {
  description = "The S3 location of the Glue job script"
  type        = string
}

variable "iam_role_arn" {
  description = "The IAM role ARN for Glue job"
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
