provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "flask_sg" {
  name        = "flask_sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
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

resource "aws_instance" "flask_app" {
  ami           = "ami-0c7217cdde317cfec" # AMI Ubuntu 22.04 na us-east-1
  instance_type = "t2.micro"
  key_name      = "vockey"

  security_groups = [aws_security_group.flask_sg.name]

  tags = {
    Name = "FlaskApp"
  }
}

output "public_ip" {
  value = aws_instance.flask_app.public_ip
}
