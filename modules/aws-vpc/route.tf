resource "aws_route_table" "this" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = merge(var.tags, { Name = "${var.vpc_name} second route" })
}

resource "aws_route_table_association" "this" {
  count = length(var.vpc_public_subnet_cidrs)

  subnet_id      = aws_subnet.this_public[count.index].id
  route_table_id = aws_route_table.this.id
}
