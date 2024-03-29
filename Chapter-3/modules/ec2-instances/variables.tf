# Instances variables
variable "ami_id" {
  description = "Uses the Ubuntu Server 22.04 LTS AMI, ap-southeast-1"
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
