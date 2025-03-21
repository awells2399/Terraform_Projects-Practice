locals {
  project = "11-multiple-resources"
  Name    = "11-multiple-resources"
}


data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ami" "nginx" {
  most_recent = true


  filter {
    name   = "name"
    values = ["bitnami-nginx-1.27.4-*-linux-debian-12-x86_64-hvm-ebs-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

output "ami_nginx" {
  value = data.aws_ami.nginx.id

}

output "ami_ubuntu" {
  value = data.aws_ami.ubuntu.id


}
