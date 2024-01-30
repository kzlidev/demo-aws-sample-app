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