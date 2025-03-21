locals {
  math       = 2 * 3          # math operators: *, /, +, -, -<number>, %
  equal      = 1 == 1         # comparison operators: ==, !=
  comparison = 1 < 2 && 2 < 3 # logical operators: <, >, <=, >=
  logical    = true && false  # logical operators: &&, ||, !
}

output "operators" {
  value = {
    math       = local.math
    equal      = local.equal
    comparison = local.comparison
    logical    = local.logical
  }
}
