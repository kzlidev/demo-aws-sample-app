module "s3" {
  source  = "app.terraform.io/likz_dev/s3/aws"
  version = "0.0.4"

  bucket_name = "likztestbucket"

  tags = {
    Name = "likztestbucket"
  }
}