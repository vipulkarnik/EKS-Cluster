resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.this.id
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.this.id
}

resource "aws_route" "public_internet" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public[0].id
  depends_on    = [aws_internet_gateway.igw]
}

resource "aws_route_table_association" "public_assoc" {
  count      = length(var.public_subnets)

  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.this.id
}

resource "aws_route" "private_nat" {
  route_table_id         = aws_route_table.private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}

resource "aws_route_table_association" "private_assoc" {
  count      = length(var.private_subnets)

  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private_rt.id
}

