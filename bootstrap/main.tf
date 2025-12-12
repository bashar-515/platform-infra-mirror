resource "tfe_organization" "main" {
  name = "Platform-515"
  email = var.email
}

module "runner" {
  source = "./modules/tfe"

  project_name = "Runner"
  organization_name = tfe_organization.main.name
  workspace_name = "runner"
}

module "site" {
  source = "./modules/tfe"

  project_name = "Site"
  organization_name = tfe_organization.main.name
  workspace_name = "site-staging"
}
