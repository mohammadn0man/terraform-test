aws_region = "ap-south-1"

use_s3_backend_flag                    = false
terraform_state_bucket_name            = "terraform-task-state-bucket"
terraform_state_dynamodb_table_name    = "terraform-task-state-table"
terraform_state_dynamodb_table_hashkey = "LockID"

key_name                        = "asus-key"
application_security_group_name = "application-security-group"

application_automation_script = "./scripts/application.sh"
instance_ami                  = "ami-06489866022e12a14"