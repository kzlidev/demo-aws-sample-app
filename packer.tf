#data "hcp_packer_version" "ami_version" {
#  bucket_name = "custom-aml-2"
#  channel     = "latest"
#}

data "hcp_packer_artifact" "custom_ami" {
  bucket_name    = "custom-aml-2"
  cloud_provider = "aws"
  channel_name   = "latest"
  region         = var.region
}
