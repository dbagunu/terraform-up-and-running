# Instances variables
variable "ami_id" {
  description = "Uses the Ubuntu Server 22.04 LTS ami"
  type = string
  default = "ami-078c1149d8ad719a7"
}
variable "instance_type" {
  description = "This is the free tier instance type"
  type = string
  default = "t2.micro"
}
variable "tag_name" {
  default = {
    Name = "test-instance"
  }
  type = map(string)
}

# Security group variables
variable "sg_id" {
  description = "security group id"
}