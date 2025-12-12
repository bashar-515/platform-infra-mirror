resource "tfe_project" "ci" {
  name = "CI/CD"
  organization = tfe_organization.main.name
}

resource "tfe_workspace" "ci" {
  name = "ci"
  organization = tfe_organization.main.name
  project_id = tfe_project.ci.id
}

resource "tfe_workspace_settings" "ci" {
  workspace_id = tfe_workspace.ci.id
  execution_mode = "local"
}
