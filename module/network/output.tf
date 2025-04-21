#Output the VPC ID
output "vpc_id" {
  value = aws_vpc.two_tier_vpc.id
  description = "The ID of the VPC created in the network module"
}
# Output the Public Subnet IDs
output "public_subnet_ids" {
    value = [
        aws_subnet.pub_sub1.id,
        aws_subnet.pub_sub2.id
    ]
    description = "The IDs of the public subnets created in the network module"
    depends_on = [ aws_subnet.pub_sub1, aws_subnet.pub_sub2 ]
}

# Output the RDS Subnet Group ID
output "rds_subnet_group_id" {
    value = aws_db_subnet_group.rds_subnet_group.id
    description = "The ID of the RDS subnet group created in the network module"
  
}
