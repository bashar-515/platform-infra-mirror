resource "tfe_project" "site" {
  name = "Site"
  organization = tfe_organization.main.name
}

resource "tfe_workspace" "site" {
  name = "site-staging"
  organization = tfe_organization.main.name
  project_id = tfe_project.site.id
}

resource "tfe_workspace_settings" "site" {
  workspace_id = tfe_workspace.site.id
  execution_mode = "local"
}
