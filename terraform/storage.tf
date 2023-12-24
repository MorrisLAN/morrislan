resource "digitalocean_spaces_bucket" "nix_builds" {
  name   = "nix-builds"
  region = "fra1"
  versioning {enabled = "true"}
  acl = "private"
}