variable "identifier" {
  description = "Name for MySQL DB"
  type = string
}

variable "engine_kind" {
  description = "Type of RDB (MySQL, PostgreSQL, MariaDB, or SQL Server)"
  type = string
}

variable "storage_size" {
  description = "Storage size of MySQL DB"
  type = number
}

variable "instance_class" {
  default = "db.t2.micro"
  type = string
}

variable "db_name" {
  default = "terraform_database"
  type = string
}

variable "db_username" {
  description = "The username for the database"
  type = string
  sensitive = true
}

variable "db_password" {
  description = "The password for the database"
  type = string
  sensitive = true
}