/* terraform {
  # Backend where the tfstate file will be saved
  backend "s3" {
    bucket = "terraform-bucketforlearning4"
    key    = "prod/sevices/webserver-cluster/terraform.tfstate"
    region = "ap-southeast-1"

    dynamodb_table = "terraform-state-locks4"
    encrypt = true
  }
} */

# Deploys Instances under ALB
module "webserver_ALB" {
  depends_on        = [module.security_group]
  source            = "../../../modules/services/load-balancer"
  instance_type     = "t2.micro"
  sg_id             = module.security_group.sg_id
  alb_sg            = module.security_group.alb_sg
  user_data         = "init.sh"
  cluster_name      = var.cluster_name
  s3_tfstate_bucket = "terraform-bucketforlearning4"
  db_key_tfstate    = "prod/data-stores/mysql/terraform.state"
}

module "security_group" {
  source       = "../../../modules/services/security-group"
  cluster_name = var.cluster_name
}

output "alb_dns_name" {
  value       = module.test_ALB.alb_dns_name
  description = "The domain name of the load balancer"
}


# Scheduled Autoscaling
resource "aws_autoscaling_schedule" "scale_out_during_business_hours" {
  scheduled_action_name = "scale_out_during_business_hours"
  min_size = 1
  max_size = 2
  desired_capacity = 2
  recurrence = "0 9 * * *"

  autoscaling_group_name = module.webserver_ALB.asg_name
}

resource "aws_autoscaling_schedule" "scale_in_at_night" {
  scheduled_action_name = "scale_in_at_night"
  min_size = 1
  max_size = 2
  desired_capacity = 1
  recurrence = "0 17 * * *"

  autoscaling_group_name = module.webserver_ALB.asg_name
}