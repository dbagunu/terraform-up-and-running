terraform {
  # Backend where the tfstate file will be saved
  backend "s3" {
    bucket = "terraform-bucketforlearning4"
    key    = "stage/data-stores/mysql/terraform.state"
    region = "ap-southeast-1"

    dynamodb_table = "terraform-state-locks4"
    encrypt = true
  }
}

module "test_rds" {
  source = "./modules/rds-mod"
  db_username = var.db_username
  db_password = var.db_password
}