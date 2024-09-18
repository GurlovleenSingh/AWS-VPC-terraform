/*data aws_subnet "ec2_subnet"{
    filter {
    name = "tag:private_subnet1"
    values = ["aws_subnet:private_subnet1"]
  }
  depends_on = [
    aws_route_table_association.private_subnet1
  ]
}*/

variable "subnet_cidr" {
  type = list(string)
  description = "map of subnets to be created"
  default = ["10.0.1.0/24", "10.0.2.0/24"]
  }  


variable "aws_region" {
    type = string
    #default = "us-east-1"
    description = "provide the aws region"
  
}
