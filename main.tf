
module "network" {
    source            = "./module/network"
    cidr_subnet_pub = var.cidr_subnet_pub 
    cidr_subnet_pri = var.cidr_subnet_pri
}

module "security" {
    source = "./module/security"
    vpc_id = module.network.vpc_id
}       

module "instance" {
    source = "./module/instance"
    instance_type = var.instance_type
    subnet_id     = module.network.public_subnet_ids
    instance_sg_id = module.security.instance_sg_id
    
}

module "loadbalancer" {
    source = "./module/loadbalancer"
    public_subnet_ids = module.network.public_subnet_ids
    loadbalancer_sg_id = module.security.loadbalancer_sg_id
    vpc_id = module.network.vpc_id
    instance_ids = module.instance.instance_ids
}

module "database" {
    source = "./module/database"
    database_sg_id = module.security.database_sg_id
    rds_subnet_group_id = module.network.rds_subnet_group_id
  
}