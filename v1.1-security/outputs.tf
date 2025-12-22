output "alb_security_group_id" {
  description = "Security group for Application Load Balancer"
  value       = aws_security_group.alb_sg.id
}

output "app_security_group_id" {
  description = "Security group for application / nodes"
  value       = aws_security_group.app_sg.id
}

output "ec2_instance_profile_name" {
  description = "IAM instance profile for EC2 / nodes"
  value       = aws_iam_instance_profile.ec2_profile.name
}
