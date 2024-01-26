data "aws_ami" "al2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023-ami-2023.3.20240122.0-kernel-6.1-arm64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"]
}

data "aws_security_group" "default" {
  name = "default"
}

resource "aws_security_group_rule" "http_from_all" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = data.aws_security_group.default
}

resource "aws_instance" "aml2" {
  ami           = data.aws_ami.al2.id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
  user_data = file("${path.module}/script/userdata.sh")
}
