resource "tfe_project" "main" {
  name = var.project_name
  organization = var.organization_name
}

resource "tfe_workspace" "main" {
  name = var.workspace_name
  organization = var.organization_name
  project_id = tfe_project.main.id

  force_delete = var.force_delete
}

resource "tfe_workspace_settings" "main" {
  workspace_id = tfe_workspace.main.id
  execution_mode = "local"
}
