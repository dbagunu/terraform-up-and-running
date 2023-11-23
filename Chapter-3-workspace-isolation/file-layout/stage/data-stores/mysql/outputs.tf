output "address" {
  value = module.stage_rds.address
  description = "Connect to the database at this endpoint"
}
output "port" {
  value = module.stage_rds.port
  description = "The port the database is listening on"
}