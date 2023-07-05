// Allows EC2 instances to call AWS services on your behalf.

resource "aws_iam_role" "ec2_s3_dynamodb_full_access_role" {
  name               = "ec2_s3_dynamodb_full_access_role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "demo_app_profile" {
  name = "demo_app_profile"

  role = aws_iam_role.ec2_s3_dynamodb_full_access_role.name
}

resource "aws_iam_role_policy_attachment" "demo_app_s3_full_access_attachment" {
  role       = aws_iam_role.ec2_s3_dynamodb_full_access_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_role_policy_attachment" "demo_app_dynamo_db_full_access_attachment" {
  role       = aws_iam_role.ec2_s3_dynamodb_full_access_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}