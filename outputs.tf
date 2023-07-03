output "instance_id" {
  description = "The ID of the provisioned EC2 instance in AZ A"
  value       = aws_instance.ec2_instance_a.id
}

output "public_ip" {
  description = "The public IP address of the provisioned EC2 instance in AZ A"
  value       = aws_instance.ec2_instance_a.public_ip
}