resource "cloudflare_device_managed_networks" "home" {
  account_id = var.cloudflare_account_id
  name       = "home"
  type       = "tls"
  config {
    tls_sockaddr = "srv-access-01:8123"
    sha256       = sha256(tls_self_signed_cert.cfzt_home.cert_pem)
  }
}

resource "tls_private_key" "cfzt_home" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "tls_self_signed_cert" "cfzt_home" {
  private_key_pem = tls_private_key.cfzt_home.private_key_pem
  subject {
    common_name  = "cfzt-home"
    organization = "MorrisLAN"
  }
  validity_period_hours = 8760
  allowed_uses = [
    "key_encipherment",
    "server_auth",
  ]
}