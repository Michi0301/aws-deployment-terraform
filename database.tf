resource "aws_dynamodb_table" "demo_app_employees_table" {
  name           = "Employees"
  hash_key       = "id"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5


  attribute {
    name = "id"
    type = "S"
  }
}