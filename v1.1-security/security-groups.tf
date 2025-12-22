resource "aws_security_group" "alb_sg" {
    name = "study-notion-alb-sg"
    description = "public access for alb"
    vpc_id = data.terraform_remote_state.networking.outputs.vpc_id
    ingress {
        description = "HTTP from internet"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        description = "allow all outbond"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }


  
}



resource "aws_security_group" "app_sg" {
    name = "study-notion-app-sg"
    description = "backend access only from ALB"
    vpc_id = data.terraform_remote_state.networking.outputs.vpc_id
    ingress {
        description = "traffic from ALB only"
        from_port = 30000
        to_port = 32767
        protocol = "tcp"
        security_groups = [aws_security_group.alb_sg.id]
    }
    egress {
        description = "allow all outbond"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

  
}
}