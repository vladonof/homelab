variable "dns_cloudflare_api_token" {
  description = "API token for Cloudflare DNS challenge"
  type        = string
  sensitive   = true
}

variable "nginxproxymanager_password" {
  description = "Password for Nginx Proxy Manager"
  type        = string
  sensitive   = true
}