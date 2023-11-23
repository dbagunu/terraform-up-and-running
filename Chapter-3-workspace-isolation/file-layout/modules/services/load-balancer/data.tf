data "aws_vpc" "default" {
  default = true
}
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}
data "terraform_remote_state" "db" {
  backend = "s3"

  config = {
    bucket = var.s3_tfstate_bucket
    key = var.s3_key_tfstate
    region = "ap-southeast-1"
  }
}