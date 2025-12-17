resource "cloudflare_pages_project" "main" {
    account_id = var.account_id
    name = var.project_name
    production_branch = "main"

    build_config = {
      build_command = "bash etc/scripts/build.sh"
      destination_dir = "dist"
    }

    deployment_configs = {
      production = {
        fail_open = false

        env_vars = {
          PROJECT_BANANA_URL = {
            type = "plain_text"
            value = "https://project-banana.com"
          }

          CYCAS_URL = {
            type = "plain_text"
            value = "https://cycas.com"
          }
        }
      }

      preview = {
        fail_open = false
      }
    }

    source = {
      type = "github"

      config = {
        owner = "bashar-515"

        path_includes = [
          "src/**",
          "etc/scripts/build.sh",
        ]

        production_branch = "main"
        production_deployments_enabled = true
        repo_name = "platform-site"
      }
    }
}

locals {
  www_domain_name = "www.${var.apex_domain_name}"
}

resource "cloudflare_pages_domain" "apex" {
  account_id = var.account_id
  name = var.apex_domain_name
  project_name = cloudflare_pages_project.main.name
}

resource "cloudflare_pages_domain" "www" {
  account_id = var.account_id
  name = local.www_domain_name
  project_name = cloudflare_pages_project.main.name
}

data "cloudflare_zone" "main" {
  filter = {
    name = var.apex_domain_name
  }
}

locals {
  ttl = 1
  type = "CNAME"
  proxied = true
}

resource "cloudflare_dns_record" "apex" {
    name = "@"
    ttl = local.ttl
    type = local.type
    zone_id = data.cloudflare_zone.main.id
    content = cloudflare_pages_project.main.subdomain

    proxied = local.proxied
}

resource "cloudflare_dns_record" "www" {
    name = "www"
    ttl = local.ttl
    type = local.type
    zone_id = data.cloudflare_zone.main.id
    content = cloudflare_pages_project.main.subdomain

    proxied = local.proxied
}

resource "cloudflare_ruleset" "main" {
  zone_id = data.cloudflare_zone.main.id

  kind = "zone"
  name = "redirect"
  phase = "http_request_dynamic_redirect"

  rules = [
    {
      action = "redirect"
      expression = "(http.host eq \"${local.www_domain_name}\")"

      action_parameters = {
        from_value = {
          status_code = 301
          preserve_query_string = true

          target_url = {
            expression = "concat(\"https://${var.apex_domain_name}\", http.request.uri.path)"
          }
        }
      }
    }
  ]
}
