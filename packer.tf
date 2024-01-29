data "hcp_packer_iteration" "custom_ami_iteration" {
  bucket_name = "custom-aml-2"
  channel     = "latest"
}

data "hcp_packer_image" "custom_ami" {
  bucket_name    = "custom-aml-2"
  cloud_provider = "aws"
  iteration_id   = data.hcp_packer_iteration.custom_ami_iteration.ulid
  region         = "ap-southeast-1"
}
