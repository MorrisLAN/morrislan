variable "env" {
  type        = string
  description = "Specify the environment (prod or dev)"

  validation {
    condition     = var.env == "prod" || var.env == "dev"
    error_message = "Environment must be either 'prod' or 'dev'"
  }
}

variable "cloudflare_account_id" {
  type        = string
  sensitive   = true
  description = "Cloudflare Account ID"
}

variable "cloudflare_zone_id" {
  type        = string
  description = "Cloudflare Zone ID"
}

variable "cloudflare_token" {
  type        = string
  sensitive   = true
  description = "Cloudflare API Token"
}

variable "github_client_id" {
  type        = string
  sensitive   = true
  description = "GitHub Client ID for SSO"
}

variable "github_client_secret" {
  type        = string
  sensitive   = true
  description = "GitHub Client Secret for SSO"
}

variable "access_tunnel_clancy_password" {
  type        = string
  sensitive   = true
  description = "Access Tunnel password for clancy"

  validation {
    condition     = can(regex("^[A-Za-z0-9+/]*={0,2}$", var.access_tunnel_clancy_password))
    error_message = "The value must be a base64-encoded string."
  }

  validation {
    condition     = length(var.access_tunnel_clancy_password) >= 32
    error_message = "The value must be 32 or more bytes in length."
  }
}

variable "all_device_rules" {
  type = list(string)
  default = [ cloudflare_device_posture_rule.gateway.id, cloudflare_device_posture_rule.firewall_windows.id, cloudflare_device_posture_rule.firewall_macos.id, cloudflare_device_posture_rule.disk_encryption_windows.id, cloudflare_device_posture_rule.disk_encryption_macos.id, cloudflare_device_posture_rule.os_version_windows.id, cloudflare_device_posture_rule.os_version_macos.id, cloudflare_device_posture_rule.os_version_ios.id, cloudflare_device_posture_rule.os_version_android.id ]
  description = "Handy list of all device rules"
}