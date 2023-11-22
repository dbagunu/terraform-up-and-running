# Security group variables
variable "server_port" {
  description = "The port the server will use for HTTP requests"
  default = 8080
  type = number
}