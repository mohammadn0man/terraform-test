resource "aws_dynamodb_table" "terraform_state_lock_table" {
  count          = var.use_s3_backend_flag == true ? 1 : 0
  name           = var.terraform_state_dynamodb_table_name
  read_capacity  = 5
  write_capacity = 5
  hash_key       = var.terraform_state_dynamodb_table_hashkey
  attribute {
    name = var.terraform_state_dynamodb_table_hashkey
    type = "S"
  }
}