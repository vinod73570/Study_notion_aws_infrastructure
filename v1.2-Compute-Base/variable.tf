variable "environment" {
    description = "Deployment environment (dev or prod)"
    type        = string
  
}
# variable "environment" {
#   description = "Deployment environment (dev or prod)"
#   type        = string
# }

variable "instance_type" {
  description = "EC2 instance type for compute nodes"
  type        = string
}

variable "asg_min_size" {
  description = "Minimum number of instances in ASG"
  type        = number
}

variable "asg_desired_capacity" {
  description = "Desired number of instances in ASG"
  type        = number
}

variable "asg_max_size" {
  description = "Maximum number of instances in ASG"
  type        = number
}

