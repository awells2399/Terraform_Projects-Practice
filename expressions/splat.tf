locals {
  firstnames_splat             = var.object_list[*].first_name #splat only works with lists
  roles_from_splat             = [for username, user_props in local.local.users_maps2 : user.roles]
  roles_from_splat_with_values = values(local.users_maps2)[*].roles
}

output "firstnames_from_splat" {
  value = local.firstnames_splat

}

output "roles_from_splat" {
  value = local.roles_from_splat
}
