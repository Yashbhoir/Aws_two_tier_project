resource "aws_security_group" "instance_sg" {
    name        = "instance_security_group"
    description = "Security group for instance with inbound and outbound rules"
    vpc_id      = var.vpc_id

    ingress {
        description = "Allow HTTP traffic"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "Allow SSH traffic"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        description = "Allow all outbound traffic"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "instance_sg"
    }
}

resource "aws_security_group" "loadbalancer_sg" {
    name        = "loadbalancer_security_group"
    description = "Security group for load balancer with inbound and outbound rules"
    vpc_id      = var.vpc_id

    ingress {
        description = "Allow HTTP traffic"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "Allow HTTPS traffic"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        description = "Allow all outbound traffic"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "loadbalancer_sg"
    }
}

resource "aws_security_group" "database_sg" {
    name        = "database_security_group"
    description = "Security group for database with inbound and outbound rules"
    vpc_id      = var.vpc_id

    ingress {
        description = "Allow MySQL traffic from instance security group"
        from_port   = 3306
        to_port     = 3306
        protocol    = "tcp"
        security_groups = [aws_security_group.instance_sg.id]
    }

    ingress {
        description = "Allow SSH traffic from instance security group"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        security_groups = [aws_security_group.instance_sg.id]
    }

    egress {
        description = "Allow all outbound traffic"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "database_sg"
    }
}




