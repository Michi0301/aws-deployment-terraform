  resource "aws_s3_bucket" "demo_app_bucket" {
  bucket = "demo-app-346"

  tags = {
    Name = "demo-app-bucket"
  }
}

resource "aws_s3_bucket_policy" "allow_access_from_demo_app" {
  bucket = aws_s3_bucket.demo_app_bucket.id
  policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowS3ReadAcess"
        Effect    = "Allow"
        Principal = {
          AWS = "arn:aws:iam::913156441918:role/demo_app_role"
        }
        Action    = ["s3:GetObject"]
        Resource  = [
                      "${aws_s3_bucket.demo_app_bucket.arn}",
                      "${aws_s3_bucket.demo_app_bucket.arn}/*"
                    ]
      },
    ]
  })
}