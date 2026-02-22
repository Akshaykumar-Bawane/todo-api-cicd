provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "web" {
  ami           = "ami-0c02fb55956c7d316"  # Ubuntu 22.04
  instance_type = "t3.micro"
  
  tags = {
    Name = "todo-api-infra-${var.environment}"
  }
  
  # Your Node.js app will run here
  user_data = <<-EOF
              #!/bin/bash
              apt update
              apt install -y nodejs npm
              # Your app will be deployed here later
              EOF
}

resource "aws_s3_bucket" "logs" {
  bucket = "todo-api-logs-${var.environment}-${random_id.bucket_suffix.hex}"
}
i
