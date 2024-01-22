module "s3" {
  source  = "app.terraform.io/likz_dev/s3/aws"
  version = "0.0.4"

  bucket_name = var.bucket_name

  tags = {
    Name = var.bucket_name
  }
}