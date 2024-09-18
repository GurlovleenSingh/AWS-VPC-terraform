
resource "aws_subnet" "private_subnet" {
    
    for_each = toset(var.subnet_cidr)
    vpc_id     = aws_vpc.my_vpc.id
    cidr_block = each.value

  tags = {

    Name = "subnet-${each.value}"
  }
  
}

# resource "aws_subnet" "private_subnet" {
#   vpc_id     = aws_vpc.my_vpc.id
#   cidr_block = "10.0.2.0/24"

#   tags = {
#     Name = "private_subnet"
#   }
# }
resource "aws_subnet" "public_subnet1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "public_subnet1"
  }
}
