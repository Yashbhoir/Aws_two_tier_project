resource "aws_vpc" "two_tier_vpc" {
    cidr_block           = "10.0.0.0/16"
    instance_tenancy     = "default"

    tags = {
        Name = "two_tier_vpc"
    }
}


data "aws_availability_zones" "az_subnets" {
    state = "available"
}


# Public Subnets

resource "aws_subnet" "pub_sub1" {
    vpc_id                  = aws_vpc.two_tier_vpc.id
    cidr_block              = var.cidr_subnet_pub[0]
    availability_zone       = data.aws_availability_zones.az_subnets.names[0]
    map_public_ip_on_launch = true

    tags = {
        Name = "pub_sub1"
    }
}

resource "aws_subnet" "pub_sub2" {
    vpc_id                  = aws_vpc.two_tier_vpc.id
    cidr_block              = var.cidr_subnet_pub[1]
    availability_zone       = data.aws_availability_zones.az_subnets.names[1]
    map_public_ip_on_launch = true

    tags = {
        Name = "pub_sub2"
    }
}


# Private Subnets

resource "aws_subnet" "pri_sub1" {
        vpc_id                  = aws_vpc.two_tier_vpc.id
        cidr_block              = var.cidr_subnet_pri[0]
        availability_zone       = data.aws_availability_zones.az_subnets.names[0]
        map_public_ip_on_launch = false

        tags = {
                Name = "pri_sub1"
        }
}

resource "aws_subnet" "pri_sub2" {
        vpc_id                  = aws_vpc.two_tier_vpc.id
        cidr_block              = var.cidr_subnet_pri[1]
        availability_zone       = data.aws_availability_zones.az_subnets.names[1]
        map_public_ip_on_launch = false

        tags = {
                Name = "pri_sub2"
        }
}


# Internet Gateway
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.two_tier_vpc.id

    tags = {
        Name = "two_tier_igw"
    }
}



# Route Table
resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.two_tier_vpc.id

    tags = {
        Name = "public_rt"
    }
}

# Route for Internet Gateway
resource "aws_route" "public_route" {
    route_table_id         = aws_route_table.public_rt.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id             = aws_internet_gateway.igw.id
}

# Associate Route Table with Public Subnets
resource "aws_route_table_association" "pub_sub1_assoc" {
    subnet_id      = aws_subnet.pub_sub1.id
    route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "pub_sub2_assoc" {
    subnet_id      = aws_subnet.pub_sub2.id
    route_table_id = aws_route_table.public_rt.id
}


# RDS Subnet Group
resource "aws_db_subnet_group" "rds_subnet_group" {
    name       = "rds_subnet_group"
    subnet_ids = [
        aws_subnet.pri_sub1.id,
        aws_subnet.pri_sub2.id
    ]

    tags = {
        Name = "rds_subnet_group"
    }
}



