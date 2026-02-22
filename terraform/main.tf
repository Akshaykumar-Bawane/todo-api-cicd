terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "web" {
  ami           = "ami-0c02fb55956c7d316"  # Ubuntu ap-south-1
  instance_type = "t2.micro"
  
  tags = {
    Name = "todo-api-terraform-${var.environment}"
  }
  
  user_data = <<-EOF
#!/bin/bash
apt update -y
apt install -y nodejs npm nginx
systemctl start nginx
EOF
}

resource "aws_s3_bucket" "logs" {
  bucket = "todo-api-logs-${random_id.suffix.hex}"
}

resource "random_id" "suffix" {
  byte_length = 4
}

