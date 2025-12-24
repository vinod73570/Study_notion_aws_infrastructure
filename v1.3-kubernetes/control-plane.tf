resource "aws_instance" "control_plane" {
    for_each = {
        for idx in range(var.control_plane_count) :
        idx => local.control_plane_subnet_map[idx]
    }
    ami = data.aws_ami.ubuntu.id
    instance_type = var.control_plane_instance_type
    subnet_id = each.value

    vpc_security_group_ids = [
        aws_security_group.control_plane_sg.id

        ]
    iam_instance_profile = data.terraform_remote_state.security.outputs.ec2_instance_profile_name
    associate_public_ip_address = false 
    user_data = file("${path.module}/user-data/control-plane.sh")
    root_block_device {
      volume_size = 30
      volume_type = "gp3"
      encrypted = true
      delete_on_termination = true
    }
    tags = {
        Name = "study-notion-${var.environment}-control-plane-${each.key}"
        Environment = var.environment
        Role = "kubernetes-control-plane"
    }
    
}