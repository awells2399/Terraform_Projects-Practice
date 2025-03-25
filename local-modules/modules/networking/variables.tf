variable "vpc_config" {
  type = object({
    cidr_block = string
    Name       = string
  })

  #   validation {
  #     condition     = can(cidernetmask(var.vpc_config.cidr_block))
  #     error_message = "The cidr block config must contain a valid CIDR block."
  #   }
}

variable "subnet_config" {
  type = map(object({
    cidr_block = string
    public     = optional(bool, false)
    az         = string
  }))

  #   validation {
  #     condition     = alltrue([for key, value in var.subnet_config : can(cidernetmask(value.cidr_block))])
  #     error_message = "The cidr block config must contain a valid CIDR block."
  #   }
}
