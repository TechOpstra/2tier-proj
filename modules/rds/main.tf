resource "aws_db_subnet_group" "rds" {
  name       = var.db_subnet_group_name
  subnet_ids = var.subnet_ids

  tags = var.tags
}

resource "aws_db_instance" "mysql" {
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  db_name              = var.db_name
  username             = var.username
  password             = var.password
  #parameter_group_name = var.parameter_group_name
  publicly_accessible  = false
  db_subnet_group_name = aws_db_subnet_group.rds.name
  vpc_security_group_ids = var.vpc_security_group_ids
  skip_final_snapshot  = true

  tags = var.tags
}

output "db_endpoint" {
  value = aws_db_instance.mysql.endpoint
}
