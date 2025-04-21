variable "public_subnet_ids" {
  description = "List of public subnet IDs for the load balancer"
  type        = list(string)
}

variable "loadbalancer_sg_id" {
    description = "Security group ID for the load balancer"
    type        = string
}

variable "vpc_id" {
    description = "The ID of the VPC where the load balancer will be deployed"
    type        = string
}

variable "instance_ids" {
    description = "The ID of the instance to attach to the target group"
    type        = list
}

