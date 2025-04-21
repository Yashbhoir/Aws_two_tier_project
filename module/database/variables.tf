variable "database_sg_id" {
    description = "The security group ID for the database"
    type        = string
}

variable "rds_subnet_group_id" {
    description = "The ID of the RDS subnet group"
    type        = string
}
