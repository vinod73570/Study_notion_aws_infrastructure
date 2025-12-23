variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "environment" {
  type        = string
  description = "Environment name (dev or prod)"
}

variable "control_plane_instance_type" {
  type        = string
  description = "EC2 instance type for control plane"
}

variable "control_plane_count" {
  type        = number
  description = "Number of control plane nodes"
}
