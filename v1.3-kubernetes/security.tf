resource "aws_security_group" "control_plane_sg" {
    name = "study-notion-${var.environment}-control-plane-sg"
    description = "Security group for Kubernetes control plane nodes"
    vpc_id=data.terraform_remote_state.networking.outputs.vpc_id
    tags = {
      Name = "study-notion-${var.environment}-control-plane-sg"
      Environment = var.environment
      role = "kubernetes-control-plane"
    }
}
  
  # Kubernetes API access from worker nodes
resource "aws_security_group_rule" "api_from_workers" {
    type = "ingress"
    from_port = 6443
    to_port = 6443
    protocol = "tcp"
    security_group_id = aws_security_group.control_plane_sg.id
    source_security_group_id = data.terraform_remote_state.security.outputs.app_security_group_id
    description = "Allow Kubernetes API access from worker nodes"
  
}

# etcd peer communication between control plane nodes
resource "aws_security_group_rule" "etcd_peer" {
    type = "ingress"
    from_port = 2379
    to_port = 2380
    protocol = "tcp"
    security_group_id = aws_security_group.control_plane_sg.id
    self = true
    description = "Allow etcd peer traffic between control plane nodes"
  
}

# etcd peer communication between control plane nodes

resource "aws_security_group_rule" "internal_cp" {
    type = "ingress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    security_group_id = aws_security_group.control_plane_sg.id
    self = true
     description       = "Allow internal control plane communication"
  
}

resource "aws_security_group_rule" "control_plane_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.control_plane_sg.id
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allow all outbound traffic"
}
