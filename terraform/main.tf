provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0f3caa1cf4417e51b" # your AMI
  instance_type = "t3.micro"
}