
output "instance_ids" {
    description = "The IDs of the created instances"
    value       = [for instance in aws_instance.web_instance : instance.id]
}

