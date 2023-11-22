variable "aws_region" {
  default = "ap-southeast-1"
}

variable "s3_bucket_name" {
  default = "terraform-bucketforlearning4"
  type    = string
}
variable "dynamoDB_name" {
  default = "terraform-state-locks4"
  type    = string
}