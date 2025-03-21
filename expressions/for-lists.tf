locals {
  double_numbers = [for num in var.numbers_list : num * 2]
  even_numbers   = [for num in var.numbers_list : num if num % 2 == 0]
  first_names    = [for obj in var.object_list : obj.first_name]
  full_names     = [for obj in var.object_list : "${obj.first_name} ${obj.last_name}"]
}

output "double_numbers" {
  value = local.double_numbers

}

output "even_numbers" {
  value = local.even_numbers
}

output "first_names" {
  value = local.first_names

}

output "full_names" {
  value = local.full_names

}
