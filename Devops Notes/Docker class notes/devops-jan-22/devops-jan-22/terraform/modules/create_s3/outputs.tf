output "my_bucket_name" {
	value = aws_s3_bucket.remote_state_s3.bucket
}