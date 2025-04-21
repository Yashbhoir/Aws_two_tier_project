output "instance_sg_id" {
  description = "The ID of the security group for the instance"
  value       = aws_security_group.instance_sg.id
  depends_on  = [aws_security_group.instance_sg]
  
}

output "loadbalancer_sg_id" {
    description = "The ID of the security group for the load balancer"
    value       = aws_security_group.loadbalancer_sg.id
    depends_on  = [aws_security_group.loadbalancer_sg]
}

output "database_sg_id" {
    description = "The ID of the security group for the database"
    value       = aws_security_group.database_sg.id
    depends_on  = [aws_security_group.database_sg]
  
}