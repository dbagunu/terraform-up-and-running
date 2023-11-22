/* terraform {
  # Backend where the tfstate file will be saved
  backend "s3" {
    bucket = "terraform-bucketforlearning4"
    key    = "stage/data-stores/mysql/terraform.state"
    region = "ap-southeast-1"

    dynamodb_table = "terraform-state-locks4"
    encrypt = true
  }
} */

module "test_rds" {
  source = "./modules/rds-mod"
  db_username = var.db_username
  db_password = var.db_password
}

/* resource "aws_db_instance" "rds_mysql" {
  identifier_prefix = var.identifier
  engine = "mysql"
  allocated_storage = var.storage_size
  instance_class = var.instance_class
  skip_final_snapshot = true
  db_name = var.db_name

  username = var.db_username
  password = var.db_password
} */