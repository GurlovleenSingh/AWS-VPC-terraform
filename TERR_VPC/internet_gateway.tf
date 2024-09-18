resource "aws_internet_gateway" "internet" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "internet"
  }
}
