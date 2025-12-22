resource "aws_eip" "nat" {
    domain = "vpc"
    tags={
        Name="study-notion-nat-eip"
    }
  
}
resource "aws_nat_gateway" "main" {
    allocation_id=aws_eip.nat.id
    subnet_id=aws_subnet.public[0].id
    tags ={
        Name="study-notion-nat"
    }
    depends_on = [ aws_internet_gateway.main ]
    
  
}