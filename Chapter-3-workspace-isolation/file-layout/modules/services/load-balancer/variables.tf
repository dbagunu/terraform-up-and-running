# Instances variables
variable "ami_id" {
  description = "Selects the AMI used for the instance"
  type        = string
  default     = "ami-078c1149d8ad719a7" # Ubuntu 22.04; Free Tier
}
variable "instance_type" {
  description = "Selects the instance type used for the EC2 instance (e.g. t2.micro)"
  type        = string
}
variable "tag_name" {
  default = {
    Name = "test-instance"
  }
  type = map(string)
}

# Security group variables
variable "sg_id" {
  description = "Security group ID"
}

# Auto-Scaling Group variables
variable "min_cap" {
  description = "Minimum number of instances running in a load balancer"
  type = number
  default = 1
}
variable "max_cap" {
  description = "Maximum number of instances running in a load balancer"
  type = number
  default = 2
}
variable "desired_cap" {
  description = "Desired number of instances running at the start"
  type = number
  default = 1
}

# Load Balancer variables
variable "lb_type" {
  default     = "application"
  type        = string
  description = "Selects type of load balancer"
}
variable "alb_sg" {
  description = "Security group ID for ALB"
}

variable "lb_listner_protocol" {
  default = "HTTP"
  type    = string
}

# Load Balancer target group variables
variable "instance_server_port" {
  default = 8080
}

# Variable for cluster names
variable "cluster_name" {
  type = string
  description = "Variable for Cluster names"
}

variable "user_data" {
  type = string
  description = "File name of user data"
}

variable "s3_tfstate_bucket" {
  description = "Name of the S3 bucker for remote tfstate of webserver-cluster"
  type = string
}

variable "db_key_tfstate" {
  description = "Key of the remote tfstate of mysql"
}