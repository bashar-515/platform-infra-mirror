output "organization_token" {
  value = tfe_organization_token.main.token
  sensitive = true
}
