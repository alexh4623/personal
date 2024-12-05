// Using this file rds secrets are stored in aws secrets manager

resource "aws_secretsmanager_secret" "staging_rds" {
  name = "staging-rds-secret"
}

resource "aws_secretsmanager_secret_version" "staging_rds_version" {
  secret_id     = aws_secretsmanager_secret.staging_rds.id
  secret_string = jsonencode({
    username = "staging_user"
    password = "staging_password"
    host     = "staging-db.example.com"
  })
}

resource "aws_secretsmanager_secret" "production_rds" {
  name = "production-rds-secret"
}

resource "aws_secretsmanager_secret_version" "production_rds_version" {
  secret_id     = aws_secretsmanager_secret.production_rds.id
  secret_string = jsonencode({
    username = "production_user"
    password = "production_password"
    host     = "production-db.example.com"
  })
}
