resource "aws_instance" "example" {
  ami           = "ami-07d6bd715f49fa0b0"
  instance_type = "t2.micro"
}