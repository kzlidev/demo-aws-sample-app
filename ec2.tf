#data "aws_ami" "al2" {
#  most_recent = true
#
#  filter {
#    name   = "name"
#    values = ["al2023-ami-2023.3.20240122.0-kernel-6.1-x86_64"]
#  }
#
#  filter {
#    name   = "virtualization-type"
#    values = ["hvm"]
#  }
#
#  owners = ["137112412989"]
#}

data "aws_vpc" "vpc" {
  tags = {
    Name = "likz-vpc"
  }
}

data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
}

data "aws_security_group" "default" {
  name   = "default"
  vpc_id = data.aws_vpc.vpc.id
}

resource "aws_security_group_rule" "http_from_all" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = data.aws_security_group.default.id
}

resource "aws_security_group_rule" "ssh_from_ic" {
  type              = "ingress"
  description       = "AWS Instance Connect IP Address (ap-southeast-1)"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["3.0.5.32/29"]
  security_group_id = data.aws_security_group.default.id
}

resource "aws_instance" "aml2" {
  ami                    = data.hcp_packer_image.custom_ami.cloud_image_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.default.id]
  subnet_id              = data.aws_subnets.subnets[0].id

  tags = {
    Name = var.instance_name
  }
  user_data = file("${path.module}/script/userdata.sh")
}
