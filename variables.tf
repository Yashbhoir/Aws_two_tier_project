# network module variable
variable "cidr_subnet_pub" {
    description = "An array of CIDR blocks for public subnets"
    type        = list(string)
}

variable "cidr_subnet_pri" {
    description = "An array of CIDR blocks for private subnets"
    type        = list(string)
}

# instance module variable
variable "instance_type" {
    description = "The type of instance to launch"
    type        = string
    default     = "t2.micro"
}

