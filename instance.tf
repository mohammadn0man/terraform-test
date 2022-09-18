resource "aws_instance" "application_instance" {
  ami                    = var.instance_ami
  instance_type          = "t2.micro"
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.application_security_group.id]
  user_data              = file(var.application_automation_script)
  tags = {
    Name = "Application_instance"
  }
}