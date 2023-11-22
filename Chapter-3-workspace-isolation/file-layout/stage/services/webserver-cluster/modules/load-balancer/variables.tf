# Instances variables
variable "ami_id" {
  description = "Uses the Ubuntu Server 22.04 LTS ami"
  type        = string
  default     = "ami-078c1149d8ad719a7"
}
variable "instance_type" {
  description = "This is the free tier instance type"
  type        = string
  default     = "t2.micro"
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
  default = 1
}
variable "max_cap" {
  default = 2
}
variable "desired_cap" {
  default = 1
}

# Load Balancer variables
variable "lb_type" {
  default     = "application"
  type        = string
  description = "Selects type of load balancer"
}
variable "alb_sg" {

}

# Load Balancer listener
variable "lb_listner_port" {
  default = 80
  type    = number
}
variable "lb_listner_protocol" {
  default = "HTTP"
  type    = string
}

# Load Balancer target group variables
variable "instance_server_port" {
  default = 8080
}
