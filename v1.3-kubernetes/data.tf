data "terraform_remote_state" "networking" {
  backend = "s3"

  config = {
    bucket = "study-notion-terraform-state-vinodjat"
    key    = "${var.environment}/v1-networking/terraform.tfstate"
    region = var.aws_region
  }
}

data "terraform_remote_state" "security" {
  backend = "s3"

  config = {
    bucket = "study-notion-terraform-state-vinodjat"
    key    = "${var.environment}/v1-security/terraform.tfstate"
    region = var.aws_region
  }
}
