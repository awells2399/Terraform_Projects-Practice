locals {
  allowed_instance_types = [
    "t2.micro",
    "t3.micro",
  ]
}

data "aws_ami_ids" "ubuntu" {
  owners = ["099720109477"] # Owner is Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "this" {
  ami           = data.aws_ami_ids.ubuntu.ids[0]
  instance_type = var.instance_type
  subnet_id     = aws_subnet.this[0].id

  root_block_device {
    volume_type           = "gp3"
    volume_size           = 10
    delete_on_termination = true
  }

  lifecycle {
    create_before_destroy = true
    postcondition {
      condition     = contains(local.allowed_instance_types, self.instance_type)
      error_message = "Invalid instance type"
    }
  }

  tags = {
    Name       = "MyInstance"
    CostCenter = "12345"
  }

}


check "cost_enter_check" {
  assert {
    condition     = can(aws_instance.this.tags.CostCenter != "")
    error_message = "Your AWS Instace does not have a CostCenter tag"
  }
}


