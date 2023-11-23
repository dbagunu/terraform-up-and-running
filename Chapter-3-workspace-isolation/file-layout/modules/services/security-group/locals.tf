locals {
  alb_ingress_from_port = 80
  alb_ingress_to_port = 80
  alb_egress_from_port = 0
  alb_egress_to_port = 0
  all_ips = ["0.0.0.0/0"]
}