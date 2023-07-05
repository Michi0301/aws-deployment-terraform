resource "aws_s3_bucket" "demo_app_bucket" {
  bucket        = "demo-app-347"
  force_destroy = true

  tags = {
    Name = "demo-app-bucket"
  }
}

resource "aws_s3_bucket_policy" "allow_access_from_demo_app_policy" {
  bucket = aws_s3_bucket.demo_app_bucket.id
  policy = data.aws_iam_policy_document.allow_access_from_demo_app_policy_data.json
}

data "aws_iam_policy_document" "allow_access_from_demo_app_policy_data" {
  version = "2012-10-17"
  statement {
    sid    = "AllowS3ReadAcess"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = [aws_iam_role.ec2_s3_dynamodb_full_access_role.arn]
    }

    actions = [
      "s3:*"
    ]

    resources = [
      aws_s3_bucket.demo_app_bucket.arn,
      "${aws_s3_bucket.demo_app_bucket.arn}/*"
    ]
  }
}