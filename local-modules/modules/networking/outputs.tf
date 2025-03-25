# 1. Ouput VPC ID
# 2. Public Subnets - Subnet_key => {Subnet_id, avaliblility_zone}
# 3. Private Subnets - Subnet_key => {Subnet_id, avaliblility_zone}

locals {
  output_public_subnets = {
    for key in keys(local.public_subnets) : key => {
      subnet_id         = aws_subnet.this[key].id
      availability_zone = aws_subnet.this[key].availability_zone
    }
  }

  output_private_subnets = {
    for key in keys(local.private_subnets) : key => {
      subnet_id         = aws_subnet.this[key].id
      availability_zone = aws_subnet.this[key].availability_zone
    }
  }
}

output "vpc_id" {
  value       = aws_vpc.this.id
  description = "The AWS ID from the created VPC."
}

output "public_subnets" {
  description = "The ID and the availability zone of public subnets."
  value       = local.output_public_subnets

}

output "private_subnets" {
  description = "The ID and the availability zone of private subnets."
  value       = local.output_private_subnets
}
