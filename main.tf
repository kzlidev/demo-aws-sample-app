module "s3" {
  source  = "app.terraform.io/likz_dev/s3/aws"
  version = "0.0.2"

  bucket_name = "likztestbucket"
}