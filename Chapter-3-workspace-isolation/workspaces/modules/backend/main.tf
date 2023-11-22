
resource "aws_s3_bucket" "terraform_state" {
  bucket = var.s3_bucket_name

  # Prevents accidental deletion of this S3 bucket
  /* lifecycle {
    prevent_destroy = true
  } */
}

# Enable versioning to see full revision history of state files
resource "aws_s3_bucket_versioning" "enabled" {
  bucket = local.s3_bucket_id
  versioning_configuration {
    status = "Enabled"
  }
}

# Enable server-side encryption by default
resource "aws_s3_bucket_server_side_encryption_configuration" "default" {
  bucket = local.s3_bucket_id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Explicitly block all public access to the S3 bucker
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket                  = local.s3_bucket_id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# DynamoDB for locking
resource "aws_dynamodb_table" "terraform_locks" {
  name         = var.dynamoDB_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}