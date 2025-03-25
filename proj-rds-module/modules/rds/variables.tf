########################
# General information
########################

variable "project_name" {
  type        = string
  description = "The Project name. Used to name the RDS instance and add relevant tags "
}

########################
# DB Configuration
########################

variable "instance_class" {
  type        = string
  default     = "db.t3.micro"
  description = "The instance class used to create the database. Requires a free-tier instance class."

  validation {
    condition     = contains(["db.t3.micro"], var.instance_class)
    error_message = "Instance class must be one of: db.t3.micro"
  }
}

variable "storage_size" {
  type        = number
  default     = 10
  description = "The amount of storage to allocate to the database. Should be between 5 and 10GB"

  validation {
    condition     = var.storage_size > 5 && var.storage_size <= 10
    error_message = "Storage size must be between 5 GB and 10 GB"
  }
}

variable "engine" {
  type        = string
  default     = "postgres-latest"
  description = "Which engine to use for the database. Must be either postgres-latest or postgres-14"

  validation {
    condition     = contains(["postgres-latest", "postgres-14"], var.engine)
    error_message = "DB engine must be postgres-latest or postgres-14"
  }
}

########################
# DB Credentials
########################

variable "credentials" {
  type = object({
    username = string
    password = string
  })

  sensitive   = true
  description = "The root username and password for the database"

  validation {
    condition = (
      length(regexall("[a-zA-Z]+", var.credentials.password)) > 0
      && length(regexall("[0-9]+", var.credentials.password)) > 0
      && length(regexall("^[a-zA-Z0-9+_?-]{6,}$", var.credentials.password)) > 0
    )

    error_message = <<-EOT
     Password must comply with the following format:
     1. Contain at least 1 character
     2. Contain at least 1 number
     3. Be at keast 6 characters long
     4. Contain only the following special characters: a-z A-Z 0-9 + _ ? - 
     EOT
  }
}


########################
# DB network
########################

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs to place the RDS instance in"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security Group IDs to attach to the RDS instance"
}
