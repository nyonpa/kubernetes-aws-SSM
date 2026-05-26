resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-test-bucket123"
  tags = {
    name = "my_bucket"
    Environment = var.env
    
  }
  
}