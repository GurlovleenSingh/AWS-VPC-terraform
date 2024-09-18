
# resource "aws_instance" "my_instance" {
#     for_each = var.subnet_map
#     subnet_id = aws_subnet.private_subnet[each.key].id
#     ami = "ami-0182f373e66f89c85"
#     instance_type = "t2.micro"
#     tags = {
#     Name = "ec2_instance"
#   }
# }
