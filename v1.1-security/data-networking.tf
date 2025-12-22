data "terraform_remote_state" "networking"{
    backend = "s3"
    config = {
      bucket = "study-notion-terraform-state-vinodjat"
      key = "v1-networking/terraform.tfstate"
      region = "ap-south-1"
    }

}