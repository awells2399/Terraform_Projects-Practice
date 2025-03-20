locals {
  project       = "input-vars-locals-outputs"
  project_owner = "Aaron Wells"
  cost_center   = "12345"
  managed_by    = "Terraform"
}

locals {
  common_tags = {
    project      = local.project
    ProjectOwner = local.project_owner
    CostCenter   = local.cost_center
    managed_by   = local.managed_by
  }
}
