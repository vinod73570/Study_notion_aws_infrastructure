terraform {
  backend "s3" {
    encrypt = true
  }
}
/* Run the following command to reconfigure the backend with the updated settings 


terraform init -reconfigure  `
  -backend-config="bucket=study-notion-terraform-state-vinodjat" `
  -backend-config="key=dev/v1-networking/terraform.tfstate" `
  -backend-config="region=ap-south-1" `
  -backend-config="dynamodb_table=terraform-locks"


*/