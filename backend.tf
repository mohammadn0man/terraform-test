# terraform {
#   backend "s3" {
#     bucket         = "terraform-task-state-bucket"
#     key            = "terraform-task-backend/terraform.tfstate"
#     region         = "ap-south-1"
#     dynamodb_table = "terraform-task-state-table"
#     encrypt        = true
#   }
# }