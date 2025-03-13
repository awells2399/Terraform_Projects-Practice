resource "random_id" "buck_suffix" {
  byte_length = 6
}

resource "aws_s3_bucket" "samplebucket" {
  bucket = "example-bucket-${random_id.buck_suffix.hex}"
}
output "bucket_name" {
  value = aws_s3_bucket.samplebucket.bucket
}
