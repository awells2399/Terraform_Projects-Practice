locals {
  project_name = "public-modules"

  shared_tags = {
    Project     = local.project_name
    Terraform   = "true"
    Environment = "dev"
    Name        = local.project_name
  }
}
