resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = {
    Name = "${var.name_prefix}-vpc"
  }
}

/*
  Public Subnet
*/

resource "aws_subnet" "public" {
  for_each = var.public_subnet

  vpc_id            = aws_vpc.vpc.id
  availability_zone = each.value.az
  cidr_block        = each.value.cidr_block

  tags = {
    Name = "${var.name_prefix}-public-${each.key}"
  }
}


resource "aws_internet_gateway" "ig" {
  count = length(aws_subnet.public) == 0 ? 0 : 1

  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.name_prefix}-ig"
  }
}

resource "aws_route_table" "public" {
  count = length(aws_subnet.public) == 0 ? 0 : 1

  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.name_prefix}-public-route-table"
  }
}

resource "aws_route_table_association" "public_route_table_association" {
  for_each = aws_subnet.public

  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route" "public_internet_gateway" {
  count = length(aws_subnet.public) == 0 ? 0 : 1

  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ig.id
}

/*
  Private Subnet
*/

resource "aws_subnet" "private" {
  for_each = var.private_subnet

  vpc_id            = aws_vpc.vpc.id
  availability_zone = each.value.az
  cidr_block        = each.value.cidr_block

  tags = {
    Name = "${var.name_prefix}-private-${each.value}"
  }
}
