module "s3" {
  source  = "app.terraform.io/likz_dev/s3/aws"
  version = "0.0.4"

  bucket_name = "${var.prefix}-demo-bucket"

  tags = {
    Name = "${var.prefix}-demo-bucket"
  }
}