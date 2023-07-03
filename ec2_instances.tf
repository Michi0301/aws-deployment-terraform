resource "aws_instance" "ec2_instance_a" {
  ami                         = var.ec2_ami
  instance_type               = var.ec2_instance_type
  user_data                   = file("${path.module}/user_data.sh")
  subnet_id                   = aws_subnet.public_subnet_a.id
  vpc_security_group_ids      = [aws_security_group.demo_app_web_security_group.id]
  iam_instance_profile        = aws_iam_instance_profile.demo_app_profile.name
  key_name                    = aws_key_pair.t495s_key.key_name
}
