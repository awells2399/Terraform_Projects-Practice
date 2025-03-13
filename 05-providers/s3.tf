resource "random_id" "buck_suffix" {
  byte_length = 6
}

resource "aws_s3_bucket" "east_bucket" {
  bucket = "east-bucket-${random_id.buck_suffix.hex}"
}

resource "aws_s3_bucket" "west_bucket" {
  provider = aws.us-west
  bucket   = "west-bucket-${random_id.buck_suffix.hex}"
}
