resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "my-state-table"
  billing_mode   = "PAY_PER_REQUEST"   #pay_per_request or provision: provision continious chargres
  hash_key       = "LockID"

  attribute {
    name ="LockID"
    type = "S"
  }

  

  tags = {
    Name        = "dynamodb-table-1"
    Environment = "production"
  }
}