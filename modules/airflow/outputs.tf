output "airflow_instance_id" {
  description = "The ID of the Airflow instance"
  value       = aws_instance.airflow_instance.id
}

output "airflow_instance_public_ip" {
  description = "The public IP of the Airflow instance"
  value       = aws_instance.airflow_instance.public_ip
}