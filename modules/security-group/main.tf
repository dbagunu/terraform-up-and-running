resource "aws_security_group" "test_sg" {
  name = "instance-sg"
  # Allow inbound HTTP requests
  ingress {
    from_port   = var.instance_server_port
    to_port     = var.instance_server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "alb_sg" {
  name = "test-alb-sg"
  # Allow inbound HTTP requests
  ingress {
    from_port   = var.alb_port
    to_port     = var.alb_port
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