# Security group variables
variable "instance_server_port" {
  description = "The port the server will use for HTTP requests"
  default     = 8080
  type        = number
}

variable "alb_port" {
  description = "The port the server will use for HTTP requests"
  default     = 80
  type        = number
}

variable "cluster_name" {
  description = "Naming the security group with respect to its cluster"
  type = string
}