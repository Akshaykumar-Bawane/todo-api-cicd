terraform {
  backend "s3" {
    bucket = "todo-api-tfstate-akshay-2026"
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_key_pair" "deployer" {
  key_name   = "todo-api-key"
  public_key = var.public_key
}

resource "aws_instance" "web" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t3.micro"
  key_name      = aws_key_pair.deployer.key_name

  tags = {
    Name = "todo-api-${var.environment}"
  }
}