/* terraform {
  # Backend where the tfstate file will be saved
  backend "s3" {
    bucket = "terraform-bucketforlearning4"
    key    = "stage/sevices/webserver-cluster/terraform.tfstate"
    region = "ap-southeast-1"

    dynamodb_table = "terraform-state-locks4"
    encrypt = true
  }
} */

# Deploys Instances under ALB
module "test_ALB" {
  depends_on        = [module.security_group]
  source            = "../../../modules/services/load-balancer"
  sg_id             = module.security_group.sg_id
  alb_sg            = module.security_group.alb_sg
  user_data         = "init.sh"
  cluster_name      = var.cluster_name
  s3_tfstate_bucket = "terraform-bucketforlearning4"
  s3_key_tfstate    = "stage/data-stores/mysql/terraform.state"
}

module "security_group" {
  source       = "../../../modules/services/security-group"
  cluster_name = var.cluster_name
}

output "alb_dns_name" {
  value       = module.test_ALB.alb_dns_name
  description = "The domain name of the load balancer"
}
