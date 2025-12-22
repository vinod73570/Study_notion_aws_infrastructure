variable "aws_region" {
    description = "aws region for all aws resource"
    type = string
    # default = "ap-south-1"
  
}
variable "vpc_cidr" {
    description = "CIDR block for the VPC"
    type=string
    # default = "10.0.0.0/16"
    

}
variable "public_subnet_cidrs" {
    description = "List of CIDR blocks for public subnets"
    type = list(string)
    
  
}
variable "private_subnet_cidrs" {
    description = "List of CIDR blocks for private subnets"
    type = list(string)
  
}
variable "availability_zones" {
    description = "List of availability zones to use"
    type = list(string)
  
}