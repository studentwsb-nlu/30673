output "vpc_id" {
  value = module.vpc.vpc_id
}

output "rds_endpoint" {
  value = module.rds.endpoint
}

output "web_asg_name" {
  value = module.ec2.asg_name
}
