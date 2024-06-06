variable "stream_name" {
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

variable "environment" {
  description = "The environment tag for the Kinesis stream"
  type        = string
}
