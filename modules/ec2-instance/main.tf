resource "aws_instance" "Ubuntu" {
  ami = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.test-sg.id] # Creates an implicit dependency on SG
  tags = var.tag_name
  user_data = file("init.sh")
  user_data_replace_on_change = true

}
resource "aws_security_group" "test-sg" {
  name = "instance-sg"
  ingress {
    from_port        = var.server_port
    to_port          = var.server_port
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}