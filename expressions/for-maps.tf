locals {
  double_maps = { for key, value in var.numbers_map : key => value * 2 }
  even_maps   = { for key, value in var.numbers_map : key => value if value % 2 == 0 }
}

output "double_maps" {
  value = local.double_maps

}

output "even_maps" {
  value = local.even_maps

}
