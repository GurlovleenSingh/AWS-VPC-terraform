
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

output "ssm_subnet_ids" {

 value = [ for subnet in aws_ssm_parameter.subnet_ids : subnet.value]
 sensitive = true
}
