resource "aws_db_instance" "rds_mysql" {
  identifier_prefix = var.identifier
  engine = "mysql"
  allocated_storage = var.storage_size
  instance_class = var.instance_class
  skip_final_snapshot = true
  db_name = var.db_name

  username = var.db_username
  password = var.db_password
}