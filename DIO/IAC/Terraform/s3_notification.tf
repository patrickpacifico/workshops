resource "aws_s3_bucket_notification" "s3_notification" {
  bucket = aws_s3_bucket.s3_bucket_notification.id

  queue {
    events        = ["s3:ObjectCreated:*"]
    queue_arn     = aws_sqs_queue.s3-notifications-sqs.arn
    filter_prefix = "arquivos/"
  }
}
