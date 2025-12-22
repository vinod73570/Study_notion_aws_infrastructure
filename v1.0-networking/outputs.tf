output "vpc_id" {
    description="id of vpc"
    value=aws_vpc.main.id
  
}
output "public_subnet_ids" {
    description = "public subnet ids"
    value=aws_subnet.public[*].id
}
output "private_subnet_ids" {
    description = "private subnet id "
    value= aws_subnet.private[*].id
}