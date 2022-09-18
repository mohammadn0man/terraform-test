variable "aws_region" {
  default = "ap-south-1"
}
variable "use_s3_backend_flag" {
  default = false
}

variable "terraform_state_bucket_name" {
}
variable "terraform_state_dynamodb_table_name" {
}
variable "terraform_state_dynamodb_table_hashkey" {
}

variable "application_security_group_name" {
}
variable "key_name" {
}

variable "instance_ami" {
}
variable "application_automation_script" {
}
