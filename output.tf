output "load_balancer_dns_name" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.this.dns_name
}
output "load_balancer_name" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.this.name
}
output "load_balancer_arn" {
  description = "The ARN of the load balancer"
  value       = aws_lb.this.arn
}

output "target_group_arn" {
  description = "The ARN of the target group"
  value       = aws_lb_target_group.this.arn
}

output "security_group_id" {
  description = "The ID of the security group created for the load balancer"
  value       = aws_security_group.sg.id
}

output "security_group_name" {
  description = "The name of the security group created for the load balancer"
  value       = aws_security_group.sg.name
}
