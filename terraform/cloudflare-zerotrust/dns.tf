resource "cloudflare_record" "access_app_status" {
  zone_id         = var.cloudflare_zone_id
  name            = var.env == "prod" ? "status.morrislan.net" : "status-${var.env}.morrislan.net"
  comment         = "CNAME to Clancy ZT Tunnel for Network Status page"
  value           = cloudflare_tunnel.clancy.cname
  allow_overwrite = true
  type            = "CNAME"
  proxied         = true
  depends_on      = [cloudflare_tunnel.clancy]
}

resource "cloudflare_record" "access_app_ha" {
  zone_id         = var.cloudflare_zone_id
  name            = var.env == "prod" ? "ha.morrislan.net" : "ha-${var.env}.morrislan.net"
  comment         = "CNAME to Clancy ZT Tunnel for Home Assistant"
  value           = cloudflare_tunnel.clancy.cname
  allow_overwrite = true
  type            = "CNAME"
  proxied         = true
  depends_on      = [cloudflare_tunnel.clancy]
}

resource "cloudflare_record" "access_app_unifi" {
  zone_id         = var.cloudflare_zone_id
  name            = var.env == "prod" ? "unifi.morrislan.net" : "unifi-${var.env}.morrislan.net"
  comment         = "CNAME to Clancy ZT Tunnel for UniFi Controller"
  value           = cloudflare_tunnel.clancy.cname
  allow_overwrite = true
  type            = "CNAME"
  proxied         = true
  depends_on      = [cloudflare_tunnel.clancy]
}

resource "cloudflare_record" "access_app_clancyadmin" {
  zone_id         = var.cloudflare_zone_id
  name            = var.env == "prod" ? "clancyadmin.morrislan.net" : "clancyadmin-${var.env}.morrislan.net"
  comment         = "CNAME to Clancy ZT Tunnel for Clancy Admin"
  value           = cloudflare_tunnel.clancy.cname
  allow_overwrite = true
  type            = "CNAME"
  proxied         = true
  depends_on      = [cloudflare_tunnel.clancy]
}

resource "cloudflare_record" "access_app_homeradmin" {
  zone_id         = var.cloudflare_zone_id
  name            = var.env == "prod" ? "homeradmin.morrislan.net" : "homeradmin-${var.env}.morrislan.net"
  comment         = "CNAME to Clancy ZT Tunnel for Homer Admin"
  value           = cloudflare_tunnel.clancy.cname
  allow_overwrite = true
  type            = "CNAME"
  proxied         = true
  depends_on      = [cloudflare_tunnel.clancy]
}
