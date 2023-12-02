resource "cloudflare_device_settings_policy" "morrislan_settings" {
  account_id        = var.cloudflare_account_id
  name              = "MorrisLAN WARP Profile"
  description       = "Default WARP profile for accessing MorrisLAN resources"
  default           = true
  enabled           = true
  allow_mode_switch = false
  switch_locked     = false
  allowed_to_leave  = true
  allow_updates     = true
  auto_connect      = 1200
}