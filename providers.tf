terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.87"
    }

    aws = {
# Defining provider source as registry.terraform.io/hashicorp/aws or
# Defining provider source as hashicorp/aws or
source  = "hashicorp/aws"
version = "~> 3.0"
}
}
}# Configuring the AWS provider in Terraform configuration file.

provider "aws" {
region = "us-east-1"
  }

provider "snowflake" {
  role = "admin"
}

resource "snowflake_database" "db" {
  name = "robots_events"
}

resource "snowflake_warehouse" "warehouse" {
  name           = "etl"
  warehouse_size = "xsmall"
  auto_suspend   = 60
}

