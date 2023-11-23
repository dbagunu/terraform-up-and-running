resource "aws_launch_configuration" "test_launch_config" {
  image_id        = var.ami_id
  instance_type   = var.instance_type
  security_groups = [var.sg_id]
  user_data       = templatefile(var.user_data, {
    db_address = data.terraform_remote_state.db.outputs.address
    db_port = data.terraform_remote_state.db.outputs.port
  })

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "test_asg" {
  launch_configuration = aws_launch_configuration.test_launch_config.name
  vpc_zone_identifier  = local.aws_subnet_ids

  target_group_arns = [aws_lb_target_group.asg.arn]
  health_check_type = "ELB"

  min_size         = var.min_cap
  desired_capacity = var.desired_cap
  max_size         = var.max_cap

  tag {
    key                 = "Name"
    value               = "${var.cluster_name}-asg"
    propagate_at_launch = true
  }
}

resource "aws_lb" "test_alb" {
  name               = "${var.cluster_name}-alb"
  load_balancer_type = var.lb_type
  subnets            = local.aws_subnet_ids
  security_groups    = [var.alb_sg]
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.test_alb.arn
  port              = var.lb_listner_port
  protocol          = var.lb_listner_protocol

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "404: page not found"
      status_code  = 404
    }
  }
}

resource "aws_lb_target_group" "asg" {
  name     = "${var.cluster_name}-tg"
  port     = var.instance_server_port
  protocol = var.lb_listner_protocol
  vpc_id   = data.aws_vpc.default.id

  health_check {
    path                = "/"
    protocol            = var.lb_listner_protocol
    matcher             = "200"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener_rule" "asg" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 100

  condition {
    path_pattern {
      values = ["*"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.asg.arn
  }
}