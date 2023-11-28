resource "cloudflare_record" "github_verify" {
  count           = var.env == "prod" ? 1 : 0
  zone_id         = var.cloudflare_zone_id
  name            = "_github-challenge-MorrisLAN-org.morrislan.net"
  comment         = "Domain ownership verification for GitHub"
  value           = "e2628155b4"
  allow_overwrite = true
  type            = "TXT"
}