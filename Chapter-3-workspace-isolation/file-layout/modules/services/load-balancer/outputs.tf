output "alb_dns_name" {
  value = aws_lb.test_alb.dns_name
}
output "asg_name" {
  value = aws_autoscaling_group.test_asg.name
  description = "The name of the ASG"
}