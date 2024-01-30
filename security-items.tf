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