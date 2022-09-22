# #? terraform init

# provider "aws" {
#   region     = "us-east-1"
#   access_key = "AKIAVVT4MHHZTXNDH5Z5"
#   secret_key = "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"
# }

# #? terraform init

# resource "aws_s3_bucket" "this" {
#   bucket        = "s3-pacifico-aws"

#   tags = {
#     Create-by   = "Patrick Pacífico"
#     Time        = var.time
#     Terraform   = "true"
#     Environment = "test"
#   }
# }

# resource "aws_sqs_queue" "this" {
#   name                      = "sqs-pacifico-aws"
#   delay_seconds             = 90
#   max_message_size          = 2048
#   message_retention_seconds = 86400
#   receive_wait_time_seconds = 10

#   tags = {
#     Create-by               = "Patrick Pacífico"
#     Time                    = var.time
#     Terraform               = "true"
#     Environment             = "test"
#   }
# }

# #? terraform plan OU terraform plan -out="main.tfplan"
# #? terraform apply OU terraform apply "main.tfplan"

# resource "aws_s3_bucket" "state" {
#   bucket        = "s3-state-pacifico-terraform"
#   force_destroy = "false"

#   tags = {
#     Create-by   = "Patrick Pacífico"
#     Time        = var.time
#     Terraform   = "true"
#     Environment = "test"
#   }
# }

# #? terraform plan OU terraform plan -out="main.tfplan"
# #? terraform apply OU terraform apply "main.tfplan"

# terraform {
#   backend "s3" {    
#     bucket     = "s3-state-pacifico-terraform"  
#     key        = "state/workshop"
#     region     = "us-east-1"
#     access_key = "AKIAVVT4MHHZTXNDH5Z5"
#     secret_key = "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"
#   }
# }

# #? terraform init

# #? terraform destroy 
# #? OU 
#  terraform destroy \
#   -target aws_sqs_queue.this \
#   -target aws_s3_bucket.this \
#   -target aws_sqs_queue.gft \
#   -target aws_s3_bucket.gft