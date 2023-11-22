output "address" {
  value = module.test_rds.address
  description = "Connect to the database at this endpoint"
}
output "port" {
  value = module.test_rds.port
  description = "The port the database is listening on"
}