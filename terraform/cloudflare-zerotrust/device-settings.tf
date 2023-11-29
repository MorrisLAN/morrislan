resource "cloudflare_device_settings_policy" "morrislan_settings" {
  account_id           = var.cloudflare_account_id
  name                 = var.env == "prod" ? "MorrisLAN WARP Profile" : "MorrisLAN WARP Profile (${var.env})"
  description          = "Default WARP profile for accessing MorrisLAN resources"
  default              = true
  enabled              = true
  allow_mode_switch    = false
  switch_locked        = true
  allowed_to_leave     = false
  allow_updates        = true
  auto_connect         = 180
}