#terraform {
  # Backend where the tfstate file will be saved
#  backend "s3" {
#    bucket = "terraform-bucketforlearning4"
#    key    = "workspaces-example/terraform.tfstate"
#    region = "ap-southeast-1"

#    dynamodb_table = "terraform-state-locks4"
#    encrypt = true
#  }
#}

module "backend" {
  source = "./modules/s3-backend"
}
