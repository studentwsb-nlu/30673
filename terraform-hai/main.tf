terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"
}

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
}

module "rds" {
  source = "./modules/rds"
  vpc_id = module.vpc.vpc_id
  db_subnet_ids = module.vpc.db_subnet_ids
  security_group_ids = [module.security_groups.rds_sg_id]
}

module "ec2" {
  source = "./modules/ec2"
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnet_ids
  security_group_ids = [module.security_groups.web_sg_id]
  rds_endpoint = module.rds.endpoint
  target_group_arn = module.alb.target_group_arn
}

module "alb" {
  source                = "./modules/alb"
  vpc_id                = module.vpc.vpc_id
  subnet_ids            = module.vpc.public_subnet_ids
  alb_security_group_id = module.security_groups.web_sg_id
}
