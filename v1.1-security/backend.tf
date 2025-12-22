terraform {
  backend "s3" {
    encrypt = true
  }
}
/* Run the following command to reconfigure the backend with the updated settings

terraform init -migrate-state `
  -backend-config="bucket=study-notion-terraform-state-vinodjat" `
  -backend-config="key=dev/v1-security/terraform.tfstate" `
  -backend-config="region=ap-south-1" `
  -backend-config="dynamodb_table=terraform-locks"
  
*/