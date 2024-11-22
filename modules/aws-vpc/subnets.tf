resource "aws_subnet" "this_public" {
  count             = length(var.vpc_public_subnet_cidrs)
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.vpc_public_subnet_cidrs[count.index]
  availability_zone = data.aws_availability_zones.this.names[count.index]

  tags = merge(var.tags, { Name = "${var.vpc_name} public ${count.index + 1}" })
}

resource "aws_subnet" "this_private" {
  count             = length(var.vpc_private_subnet_cidrs)
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.vpc_private_subnet_cidrs[count.index]
  availability_zone = data.aws_availability_zones.this.names[count.index]

  tags = merge(var.tags, { Name = "${var.vpc_name} private ${count.index + 1}" })
}
