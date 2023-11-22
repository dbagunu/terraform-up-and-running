resource "aws_instance" "Ubuntu" {
  ami = var.ami_id
  instance_type = var.instance_type
  tags = var.tag_name
}
