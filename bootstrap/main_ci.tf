resource "tfe_project" "runner" {
  name = "Runner"
  organization = tfe_organization.main.name
}

resource "tfe_workspace" "runner" {
  name = "runner"
  organization = tfe_organization.main.name
  project_id = tfe_project.runner.id
}

resource "tfe_workspace_settings" "runner" {
  workspace_id = tfe_workspace.runner.id
  execution_mode = "local"
}
