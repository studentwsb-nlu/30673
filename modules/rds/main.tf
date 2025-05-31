// RDS Module
resource "aws_db_subnet_group" "main" {
  name       = "main-db-subnet-group"
  subnet_ids = var.db_subnet_ids
}

resource "aws_db_instance" "main" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  name                 = "webappdb"
  username             = "admin"
  password             = "changeme123"
  db_subnet_group_name = aws_db_subnet_group.main.name
  vpc_security_group_ids = var.security_group_ids
  skip_final_snapshot  = true
}

output "endpoint" {
  value = aws_db_instance.main.endpoint
}
