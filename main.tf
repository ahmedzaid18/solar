provider "aws" {
  region = "us-east-1" # Replace with your desired region
  access_key = "AKIAYLZZKESD6PAT26ED"
  secret_key = "bY3DCVWN6MF68kX1hbpWHxh48D81jKAI1gEhiZZc"
}
resource "aws_security_group" "HTTPSG_22" {
  

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Add SSH ingress rule
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Replace with a more restrictive CIDR if needed
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Replace with a more restrictive CIDR if needed
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Replace with a more restrictive CIDR if needed
  }
    ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Replace with a more restrictive CIDR if needed
  }
  ingress {
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Replace with a more restrictive CIDR if needed
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
   }

resource "aws_instance" "monit_instance_test" {

  ami                         = "ami-005fc0f236362e99f"

  instance_type               = "t2.micro"
  
  vpc_security_group_ids      = [aws_security_group.HTTPSG_22.id] 
  


  }




 output "instance_ip" {
   value = aws_instance.monit_instance_test.public_ip
}
