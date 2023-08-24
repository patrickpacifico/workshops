resource "aws_sqs_queue" "s3-notifications-sqs" {

  name   = "s3-notifications-sqs"
  policy = <<POLICY
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": "*",
        "Action": "sqs:SendMessage",
        "Resource": "arn:aws:sqs:*:*:s3-notifications-sqs",
        "Condition": {
          "ArnEquals": {
           "aws:SourceArn":     
              "${aws_s3_bucket.s3_bucket_notification.arn}" 
           }
        }
      }
    ]
  }
  POLICY
}
