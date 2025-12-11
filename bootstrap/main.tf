resource "tfe_organization" "main" {
  name = "Platform-515"
  email = var.email
}

resource "tfe_organization_token" "main" {
  organization = tfe_organization.main.name
}

resource "tfe_project" "ci_project" {
  name = "CI State"
  organization = tfe_organization.main.name
}

resource "tfe_workspace" "ci_workspace" {
  name = "ci-state"
  organization = tfe_organization.main.name
  project_id = tfe_project.ci_project.id
}

resource "tfe_workspace_settings" "ci_workspace_settings" {
  workspace_id = tfe_workspace.ci_workspace.id
  execution_mode = "local"
}
