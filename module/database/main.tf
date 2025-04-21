
resource "aws_db_instance" "mysql_database" {
    allocated_storage    = 5
    engine               = "mysql"
    engine_version       = "8.0"
    instance_class       = "db.t3.medium"
    username             = "admin"
    password             = "password123"
    parameter_group_name = "default.mysql8.0"
    publicly_accessible  = false
    multi_az = false
    vpc_security_group_ids = [var.database_sg_id]
    db_subnet_group_name   = var.rds_subnet_group_id
    skip_final_snapshot = true
    tags = {
        Name = "MyDatabase"
    }
}