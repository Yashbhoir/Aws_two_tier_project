data "aws_ami" "amazon_linux_2" {
    most_recent = true

    filter {
        name   = "name"
        values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["amazon"]
}


resource "aws_instance" "web_instance" {
    ami           = data.aws_ami.amazon_linux_2.id
    instance_type = var.instance_type
    count = length(var.subnet_id)
    subnet_id = var.subnet_id[count.index]
    vpc_security_group_ids = [var.instance_sg_id]
 
    tags = {
        Name = "web_instance_${count.index + 1}"
    }

    user_data = <<-EOF
                #!/bin/bash
                yum update -y
                amazon-linux-extras enable nginx1
                yum install -y nginx
                systemctl start nginx
                systemctl enable nginx
                EOF


    lifecycle {
        create_before_destroy = true
    }
}


