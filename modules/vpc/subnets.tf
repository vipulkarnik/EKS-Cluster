resource "aws_subnet" "public" {
  count                   = length(var.public_subnets)
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.public_subnets[count.index]
  availability_zone = var.azs[count.index]
  map_public_ip_on_launch = true
  tags = {
  "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  "kubernetes.io/role/elb" = "1"
}
}

resource "aws_subnet" "private" {
  count      = length(var.private_subnets)
  vpc_id     = aws_vpc.this.id
  availability_zone = var.azs[count.index]
  cidr_block = var.private_subnets[count.index]
  tags = {
  "kubernetes.io/role/internal-elb" = "1"
  "kubernetes.io/cluster/${var.cluster_name}" = "shared"
}
}
