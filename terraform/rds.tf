//create RDS instances for prod and staging
resource "aws_db_instance" "production_db" {
  identifier        = "production-db"
  engine            = "mysql"
  instance_class    = "db.t3.medium"
  allocated_storage = 20
  username          = "admin"
  password          = "password"
  db_name           = "production_db"
  publicly_accessible = false
}

resource "aws_db_instance" "staging_db" {
  identifier        = "staging-db"
  engine            = "mysql"
  instance_class    = "db.t3.medium"
  allocated_storage = 20
  username          = "admin"
  password          = "password"
  db_name           = "staging_db"
  publicly_accessible = false
}
