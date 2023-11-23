resource "aws_security_group" "instance_sg" {
  name = "${var.cluster_name}-instance-sg"
  description = "Security Group allowing ingress from ALB SG"
  # Allow inbound HTTP requests
  ingress {
    from_port   = var.instance_server_port
    to_port     = var.instance_server_port
    protocol    = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }
}

resource "aws_security_group" "alb_sg" {
  name = "${var.cluster_name}-alb-sg"
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