resource "tfe_organization" "main" {
  name = "Platform-01"
  email = var.email
}

module "runner" {
  source = "./modules/tfe"

  project_name = "Runner"
  organization_name = tfe_organization.main.name
  workspace_name = "runner"

  force_delete = true
}

module "site_staging" {
  source = "./modules/tfe"

  project_name = "Site"
  organization_name = tfe_organization.main.name
  workspace_name = "site-staging"
}

module "site_production" {
  source = "./modules/tfe"

  project_id = module.site_staging.project_id
  organization_name = tfe_organization.main.name
  workspace_name = "site-production"
}
