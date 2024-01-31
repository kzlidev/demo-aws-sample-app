resource "aws_instance" "aml2" {
  ami                         = data.hcp_packer_artifact.custom_ami.external_identifier
  #  ami                         = "ami-0097cc7843f764ef5"
  instance_type               = var.instance_type
  vpc_security_group_ids      = [data.aws_security_group.default.id]
  subnet_id                   = data.aws_subnets.subnets.ids[0]
  associate_public_ip_address = true

  tags = {
    Name = "${var.prefix}-cat-instance"
  }

  user_data = templatefile("${path.module}/script/userdata.tftpl",
    {
      PREFIX      = var.prefix,
      TIMESTAMP   = timestamp(),
      PLACEHOLDER = var.placeholder,
      WIDTH       = var.width,
      HEIGHT      = var.height
    }
  )
}
