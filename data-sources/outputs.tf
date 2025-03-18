output "ami_unbuntu_east" {
  value = data.aws_ami_ids.ubuntu.id
}

output "ubuntu_west" {
  value = data.aws_ami_ids.ubuntu_west.id
}
