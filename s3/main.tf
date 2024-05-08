resource "aws_s3_bucket" "this" {
  bucket = "intro-terraform-2024Q1"

  tags = {
    Name   = "intro-terraform-2024Q1"
    Author = "Camila"
  }
}
