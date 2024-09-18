resource "aws_eip" "elastic_ip" {
 for_each = toset(var.subnet_cidr)
  domain   = "vpc"
}
resource "aws_nat_gateway" "my_nat" {
   for_each = toset(var.subnet_cidr)
  subnet_id = aws_subnet.private_subnet[each.value].id
  allocation_id = aws_eip.elastic_ip[each.value].id
 

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the EIP
  depends_on = [aws_eip.elastic_ip]
}
