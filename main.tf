module "test_ALB" {
  depends_on = [module.security_group]
  source     = "./modules/load-balancer"
  sg_id      = module.security_group.sg_id
  alb_sg     = module.security_group.alb_sg
}
module "security_group" {
  source = "./modules/security-group"
}

output "alb_dns_name" {
  value = module.test_ALB.alb_dns_name
  description = "The domain name of the load balancer"
}