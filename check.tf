check "ami_version_check" {
  data "aws_instance" "hashicat_current" {
    instance_tags = {
      Name = "${var.prefix}-cat-instance"
    }
  }

  assert {
    condition     = data.aws_instance.hashicat_current.ami == data.hcp_packer_image.custom_ami.cloud_image_id
    error_message = "Must use the latest available AMI, ${data.hcp_packer_image.custom_ami.cloud_image_id}."
  }
}