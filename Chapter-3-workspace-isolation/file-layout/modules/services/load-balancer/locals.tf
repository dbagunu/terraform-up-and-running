locals {
  aws_subnet_ids = data.aws_subnets.default.ids
  lb_listner_port = 80
}