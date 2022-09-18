# terraform init -backend-config=file.tfbackend -force-copy
terraform {
  backend "s3" {
  }
}