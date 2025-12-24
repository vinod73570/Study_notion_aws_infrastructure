output "control_plane_instance_ids" {
    description = "EC2 instance IDs of Kubernetes control plane nodes"
    value = [
        for instance in aws_instance.control_plane :
        instance.id
    ]
  
}

output "control_plane_private_ip" {
    description = "Private IP addresses of Kubernetes control plane nodes"
    value = [
        for instance in aws_instance.control_plane :
        instance.private_ip
    ]
  
}

output "control_plane_security_group_id" {
  description = "Security group ID for Kubernetes control plane"
  value = aws_security_group.control_plane_sg.id
}