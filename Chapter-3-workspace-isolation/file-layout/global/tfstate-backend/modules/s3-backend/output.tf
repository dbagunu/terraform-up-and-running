output "s3_state_arn" {
  value = aws_s3_bucket.terraform_state.arn
  description = "AWS S3 bucket for tfstate arn"
}
output "dynamodb_lock_table_name" {
  value = aws_dynamodb_table.terraform_locks.name
  description = "AWS dynamoDB table name"
}