terraform {
  backend "s3" {
    bucket = "study-notion-terraform-state-vinodjat"
    key = "v1-security/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt = true
    
  }
}