resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "${var.env}-infra-app-table"
  billing_mode   = "PAY_PER_REQUEST"   #pay_per_request or provision: provision continious chargres
  hash_key       = var.hashkey

  attribute {
    name ="LockID"
    type = "S"
  }

  

  tags = {
    Name        = "${var.env}-table"
    Environment = var.env
  }
}