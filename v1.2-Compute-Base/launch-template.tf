resource "aws_launch_template" "compute" {
  name_prefix   = "study-notion-${var.environment}-compute-"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  iam_instance_profile {
    name = data.terraform_remote_state.security.outputs.ec2_instance_profile_name
  }
  network_interfaces {
    associate_public_ip_address = false
    security_groups = [
      data.terraform_remote_state.security.outputs.app_security_group_id
    ]

  }
  user_data = base64encode(
    file("${path.module}/user-data.sh")
  )

  tag_specifications {
    resource_type = "instance"

    tags = {
      name        = "study-notion-${var.environment}-compute"
      Environment = var.environment
    }
  }

}
