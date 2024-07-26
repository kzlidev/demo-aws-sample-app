module "s3" {
  source  = "app.terraform.io/likz_dev/s3/aws"
  version = "0.0.13"

  bucket_name = "${var.prefix}-demo-bucket"
  region = "ap-southeast-1"

  tags = {
    Name = "${var.prefix}-demo-bucket"
  }
}
