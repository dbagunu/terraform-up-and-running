resource "aws_instance" "Ubuntu" {
  ami = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [var.sg_id] # Creates an implicit dependency on SG
  tags = var.tag_name
  user_data = file("init.sh")
  user_data_replace_on_change = true
}
