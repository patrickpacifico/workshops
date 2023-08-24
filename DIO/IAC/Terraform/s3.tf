resource "aws_s3_bucket" "s3_bucket_notification" {
  bucket        = var.bucket
  force_destroy = true
}
