# data "aws_subnet" "secret" {
#  for_each = toset(var.subnet_cidr)
# #   filter {
# #     name = "tag:Name"
# #     values = ["subnet-${each.value}"]
# #   }
#   depends_on = [ aws_subnet.private_subnet ]
# }
resource "aws_ssm_parameter" "subnet_ids" {
    for_each = aws_subnet.private_subnet
  type = "StringList"
  name = "/subnets/${each.value.id}"
  value = each.value.id
# depends_on = [ data.aws_subnet.secret ]
}

resource "aws_ssm_parameter" "vpc_id" {
  type = "StringList"
  name = "/vpc/${aws_vpc.my_vpc.id}"
  value = aws_vpc.my_vpc.id
}
