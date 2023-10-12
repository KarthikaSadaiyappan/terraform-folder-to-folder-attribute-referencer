# S3 Bucket #

resource "aws_s3_bucket" "terraform_state_files" {
  bucket = "terraform-state-files-versioned"
}

resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
  bucket = aws_s3_bucket.terraform_state_files.id
  versioning_configuration {
    status = "Enabled"
  }
}


# Dynamo DB #

resource "aws_dynamodb_table" "s3_state_lock" {
  name             = "s3_state_lock"
  hash_key         = "LockID"
  billing_mode     = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }

}