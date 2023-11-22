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
    bucket = "terraform-bucketforlearning4"
    key = "stage/data-stores/mysql/terraform.state"
    region = "ap-southeast-1"
  }
}