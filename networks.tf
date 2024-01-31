data "aws_vpc" "vpc" {
  tags = {
    Name = "${var.prefix}-vpc"
  }
}

data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
  tags = {
    "Name" = "Public*"
  }
}

resource "aws_eip" "eip" {
  instance = aws_instance.aml2.id
  domain   = "vpc"
}
