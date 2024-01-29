check "ami_version_check" {
  data "aws_instance" "hashiapp_current" {
    instance_tags = {
      Name = var.instance_name
    }
  }

  assert {
    condition     = aws_instance.aml2.ami == data.hcp_packer_image.custom_ami.cloud_image_id
    error_message = "Must use the latest available AMI, ${data.hcp_packer_image.custom_ami.cloud_image_id}."
  }
}