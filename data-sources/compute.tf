resource "aws_instance" "ec2_instance" {
  ami           = data.aws_ami_ids.ubuntu.ids[0]
  instance_type = "t2.micro"
  root_block_device {
    volume_type           = "gp3"
    volume_size           = 10
    delete_on_termination = true
  }
  tags = {
    Name = "ExampleInstance"
  }

}
