output "autoscaling_group_name" {
  description = "Name of the compute Auto Scaling Group"
  value       = aws_autoscaling_group.compute.name
}

output "launch_template_id" {
  description = "Launch Template ID used by compute layer"
  value       = aws_launch_template.compute.id
}
