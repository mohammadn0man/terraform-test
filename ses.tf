variable "emails" {
  default = {
    1 = "mohammad.noman@live.in"
  }
}
resource "aws_ses_email_identity" "verified_email" {
  for_each = var.emails
  email    = each.value
}
