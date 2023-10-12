output "sg_arn" {
  description = "arn of the security group"
  value       = aws_security_group.resource_reference.arn
}

output "sg_id" {
  description = "id of the security group"
  value = aws_security_group.resource_reference.id
}

output "sg_name" {
  description = "id of the security group"
  value = aws_security_group.resource_reference.name
}