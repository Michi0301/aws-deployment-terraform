resource "aws_key_pair" "t495s_key" {
  key_name   = "t495s"
  public_key = file("~/.ssh/id_ed25519.pub")
}