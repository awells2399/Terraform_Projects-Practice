
output "module_vpc_id" {
  value       = module.vpc.vpc_id
  description = "The AWS ID from the created VPC"
}
output "module_public_subnets" {
  value = module.vpc.public_subnets

}

output "private_subnets" {
  value = module.vpc.private_subnets

}
