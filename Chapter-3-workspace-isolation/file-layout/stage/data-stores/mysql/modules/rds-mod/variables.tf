variable "identifier" {
  default = "terraform-rds-mysql"
  type = string
}

variable "storage_size" {
  default = 5
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