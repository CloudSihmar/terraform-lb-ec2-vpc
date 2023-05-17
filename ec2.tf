resource "aws_instance" "web" {
  ami           = "ami-06c4532923d4ba1ec"
  instance_type = "t2.micro"
  user_data = file("install.sh")
  associate_public_ip_address = true
  subnet_id     = aws_subnet.public[0].id
  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = {
    Name = "HelloWorld"
  }
}
