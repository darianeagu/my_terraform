

provider "aws" {
  region = var.region
}

resource "aws_security_group" "airflow_sg" {
  name_prefix = "airflow-sg-${var.name}"
  description = "Security group for Airflow"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

// assuming a simple Apache Airflow installation on an EC2 instance with a local sqlite db
// otherwise we would generate an RDS Psql or Maria db instance to function as backend db for Apache Airflow
resource "aws_instance" "airflow_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  security_groups = [aws_security_group.airflow_sg.name]

  tags = {
    Name = "AirflowInstance"
    Name = var.name // allows the name to be flexible
  }
}

resource "aws_iam_role" "airflow_role" {
  name = "AirflowRole-${var.name}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      },
    ]
  })
}

// god like permissions which are an attack vector
resource "aws_iam_role_policy_attachment" "airflow_role_attach" {
  role       = aws_iam_role.airflow_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}
