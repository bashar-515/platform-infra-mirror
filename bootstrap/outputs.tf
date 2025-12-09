output "organization_token" {
  value = tfe_organization_token.platform.token
  sensitive = true
}
