locals {
  name = "Aaron Wells"
  age  = 15
  my_object = {
    key1 = 0
    key2 = "my value"
  }
}

output "example1" {
  value = upper(local.name)
}

output "example2" {
  value = startswith(local.name, "Dan")
}

output "example3" {
  value = abs(local.age)
}

output "example4" {
  value = pow(local.age, 2)
}

output "example5" {
  value = yamldecode(file("${path.module}/users.yaml")).users[*].name
}

output "example6" {
  value = yamlencode(local.my_object)
}
