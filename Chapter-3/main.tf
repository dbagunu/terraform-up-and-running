#terraform {
  # Backend where the tfstate file will be saved
#  backend "s3" {
#    bucket = "terraform-bucketforlearning3"
#    key    = "workspaces-example/terraform.tfstate"
#    region = "ap-southeast-1"

#    dynamodb_table = "terraform-state-locks3"
#    encrypt = true
#  }
#}

module "backend" {
  source = "./modules/backend"
}
