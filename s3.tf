resource "aws_s3_bucket" "terraform_state_bucket" {
  count  = var.use_s3_backend_flag == true ? 1 : 0
  bucket = var.terraform_state_bucket_name
}
resource "aws_s3_bucket_public_access_block" "terraform_state_bucket_access" {
  count                   = var.use_s3_backend_flag == true ? 1 : 0
  bucket                  = aws_s3_bucket.terraform_state_bucket[0].id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
resource "aws_s3_bucket_versioning" "terraform_state_bucket_versioning" {
  count  = var.use_s3_backend_flag == true ? 1 : 0
  bucket = aws_s3_bucket.terraform_state_bucket[0].id
  versioning_configuration {
    status = "Enabled"
  }
}