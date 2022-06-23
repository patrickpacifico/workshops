# resource "aws_sqs_queue" "gft" {
#   name                      = "sqs-gft-pacifico-workshop-aws"
#   delay_seconds             = 90
#   max_message_size          = 2048
#   message_retention_seconds = 86400
#   receive_wait_time_seconds = 10

#   tags = {
#     Create-by   = "Patrick Pacífico"
#     # Cloud       = var.cloud
#     Terraform   = "true"
#     Environment = "test"
#   }
# }