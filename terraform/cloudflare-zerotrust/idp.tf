resource "cloudflare_access_identity_provider" "github" {
  account_id = var.cloudflare_account_id
  name       = "MorrisLAN GitHub"
  type       = "github"
  config {
    client_id     = var.github_client_id
    client_secret = var.github_client_secret
  }
}

resource "cloudflare_access_identity_provider" "otp" {
  account_id = var.cloudflare_account_id
  name       = "Email OTP"
  type       = "onetimepin"
}
