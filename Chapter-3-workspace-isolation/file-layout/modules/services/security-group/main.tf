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
    from_port   = local.alb_ingress_from_port
    to_port     = local.alb_ingress_to_port
    protocol    = "tcp"
    cidr_blocks = local.all_ips
  }

  egress {
    from_port   = local.alb_egress_from_port
    to_port     = local.alb_egress_to_port
    protocol    = "-1"
    cidr_blocks = local.all_ips
  }
}