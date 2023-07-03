// Allows EC2 instances to call AWS services on your behalf.

resource "aws_iam_role" "demo_app" {
  name               = "demo_app_role"
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

  role = aws_iam_role.demo_app.name
}
