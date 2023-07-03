resource "aws_iam_role_policy_attachment" "demo_app_s3_full_access_attachment" {
  role       = aws_iam_role.demo_app.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_role_policy_attachment" "demo_app_dynamo_db_full_access_attachment" {
  role       = aws_iam_role.demo_app.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}
