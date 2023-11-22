variable "aws_region" {
  default = "ap-southeast-1"
}

variable "s3_bucket_name" {
  default = "terraform-bucketforlearning"
  type    = string
}
variable "dynamoDB_name" {
  default = "terraform-state-locks"
  type    = string
}