resource "cloudflare_device_managed_networks" "home" {
  account_id = var.cloudflare_account_id
  name       = "Home"
  type       = "tls"
  config {
    tls_sockaddr = "10.1.240.5:8123"
    sha256       = "46bb014b26217f7924d2cd0873cf18240259ba3e3a6e4318bc2f2730d2164a02"
  }
}

resource "tls_private_key" "cfzt_beacon_home" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "tls_self_signed_cert" "cfzt_beacon_home" {
  private_key_pem = tls_private_key.cfzt_beacon_home.private_key_pem
  dns_names       = ["srv-cfzt-01.morrislan.net"]
  subject {
    common_name  = "cfzt-beacon-home"
    organization = "MorrisLAN"
  }
  validity_period_hours = 8760
  allowed_uses = [
    "key_encipherment",
    "server_auth",
  ]
}