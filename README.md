## About this repo

Objective of the project was to 
1. Create a virtual machine instance that serves a static website that displays the following details of the instance
- Instance id
- IP address
- mac address
2.  Build a custom health check system that does the following:
•	checks the health of any given endpoint(s) based on its health check configuration
•	alerts the team about the health check status of the endpoint(s)
3.  Automate the provisioning of both 1 & 2 systems in a highly available environment using terraform
•	Write the terraform code in such a manner that it can even be used by non-developers to replicate this setup in any account/ region of the chosen cloud . 

How to use?

First create a tfvars file using locals.tfvars as sample.

1. `terraform init`
2. `terraform plan -var-file yourfile.tfvars`
3. `terraform apply -var-file yourfile.tfvars -auto-approve`

if decided to use s3 as backend than uncomment the content in the file backend.tf and change the values according to defined variables above then run `terraform init -migrate-state` to move state file to s3.





