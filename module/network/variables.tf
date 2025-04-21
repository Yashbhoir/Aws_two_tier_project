variable "cidr_subnet_pub" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "cidr_subnet_pri" {
    description = "List of CIDR blocks for private subnets"
    type        = list(string)
}