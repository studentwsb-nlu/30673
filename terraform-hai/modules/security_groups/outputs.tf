# Add any custom values here as needed for your environment

output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}
