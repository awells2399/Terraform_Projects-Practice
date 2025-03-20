data "aws_availability_zones" "aws_available" {
  state = "available"
}

data "aws_iam_policy_document" "static_website" {
  statement {
    sid       = "PublicReadGetObject"
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.static_website.arn}/*"]
    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }

}
