data "cloudflare_zone" "main" {
  name = "beesho.dev"
}

locals {
  ttl = 86400
  type = "CNAME"
  proxied = false
}

resource "cloudflare_dns_record" "apex" {
    name = "@"
    ttl = local.ttl
    type = local.type
    zone_id = data.cloudflare_zone.main.id
    content = var.content

    proxied = local.proxied
}

resource "cloudflare_dns_record" "www" {
    name = "www"
    ttl = local.ttl
    type = local.type
    zone_id = data.cloudflare_zone.main.id
    content = var.content

    proxied = local.proxied
}
