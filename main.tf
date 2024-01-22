resource "aws_s3_bucket" "example" {
  bucket = "kzlidev-test-s3bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}