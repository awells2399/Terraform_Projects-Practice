locals {
  ami_ids = {
    ubuntu = data.aws_ami.ubuntu.id,
    nginx  = data.aws_ami.nginx.id
  }
}

# resource "aws_instance" "from_count" {
#   count         = var.ec2_instance_count
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = "t2.micro"
#   subnet_id     = aws_subnet.main[count.index % length(aws_subnet.main)].id

#   tags = {
#     Name    = "${local.Name}-${count.index}"
#     Project = "${local.project}"
#   }
# }


resource "aws_instance" "from_list" {
  count         = length(var.ec2_instance_config_list)
  ami           = local.ami_ids[var.ec2_instance_config_list[count.index].ami]
  instance_type = var.ec2_instance_config_list[count.index].instance_type
  subnet_id = aws_subnet.main[
    var.ec2_instance_config_list[count.index].subnet_name
  ].id

  tags = {
    Name    = "${local.Name}-${count.index}"
    Project = "${local.project}"
  }
}


resource "aws_instance" "from_map" {
  # each.key => holds the key of the map
  # each.value => holds the value of the map
  for_each      = var.ec2_instance_config_map
  ami           = local.ami_ids[each.value.ami]
  instance_type = each.value.instance_type
  subnet_id     = aws_subnet.main[each.value.subnet_name].id

  tags = {
    Name    = "${local.Name}-${each.key}"
    Project = "${local.project}"
  }
}


