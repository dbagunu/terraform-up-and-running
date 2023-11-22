data "terraform_remote_state" "db" {
  backend = "s3"

  config = {
    bucket = "terraform-bucketforlearning4"
    key = "stage/data-stores/mysql/terraform.state"
    region = "ap-southeast-1"
  }
}