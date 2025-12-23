resource "aws_autoscaling_group" "compute" {
        name = "study-notion-${var.environment}-asg"

        min_size = var.asg_min_size
        max_size = var.asg_max_size
        desired_capacity= var.asg_desired_capacity

        launch_template {
          id = aws_launch_template.compute.id
          version = "$Latest"
        }
        vpc_zone_identifier = data.terraform_remote_state.networking.outputs.private_subnet_ids
        health_check_type = "EC2"
        health_check_grace_period = 300

        tag {
          key = "Name"
          value = "study-notion-${var.environment}-node"
          propagate_at_launch = true
        }
        tag {
            key = "Environment"
            value = var.environment
            propagate_at_launch = true
          
        }
  
}