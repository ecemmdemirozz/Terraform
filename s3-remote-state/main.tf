resource "aws_s3_bucket" "s3_bucket" {
    bucket = var.bucket_name
    tags = local.tags
    
}

resource "aws_s3_bucket_versioning" "versioning_ecem" {
  bucket = aws_s3_bucket.s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_s3_bucket_server_side_encryption_configuration" "ecem" {
  bucket = aws_s3_bucket.s3_bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}