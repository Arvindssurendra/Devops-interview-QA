resource "aws_dynamodb_table" "locking_table" {
	hash_key 	   = var.hash_key
	name           = var.dynamodb_name
	billing_mode   = "PAY_PER_REQUEST"
	attribute {
		name = var.hash_key
		type = "S"
	}
} 