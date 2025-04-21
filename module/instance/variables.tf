variable "instance_type" {
    description = "The type of instance to launch"
    type        = string
    default     = "t2.micro"
}

variable "subnet_id" {
    description = "The ID of the subnet to launch the instance in"
    type        = list
  
}

variable "instance_sg_id" {
    description = "The ID of the security group to associate with the instance"
    type        = string
}
