resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet.id
  }

  tags = {
    Name = "public_route_table"
  }
}
resource "aws_route_table" "private_route_table" {
  for_each = toset(var.subnet_cidr)
    vpc_id = aws_vpc.my_vpc.id
   depends_on = [ aws_nat_gateway.my_nat ]
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my_nat[each.value].id
  }

  tags = {
    Name = "private_route_table"
  }
}
resource "aws_route_table_association" "private_subnet" {
    for_each = toset(var.subnet_cidr)
  subnet_id = aws_subnet.private_subnet[each.value].id
  route_table_id = aws_route_table.private_route_table[each.value].id
}

resource "aws_route_table_association" "public_subnet1" {
    
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public_route_table.id
}
