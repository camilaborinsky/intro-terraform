resource "aws_s3_bucket" "this" {
  bucket = "intro-terraform-2024q1"

  tags = {
    Name   = "intro-terraform-2024q1"
    Author = "Camila"
  }
}
