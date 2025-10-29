variable "proxy_hosts" {
  description = "List of proxy host configurations"
  type = list(object({
    domain_names    = list(string)
    forward_scheme  = string
    forward_host    = string
    forward_port    = number
    websocket       = bool
    advanced_config = optional(string)
  }))
}

variable "certificate_id" {
  description = "Certificate ID to use for SSL"
  type        = number
  default     = 13
}

variable "block_exploits" {
  description = "Whether to block exploits"
  type        = bool
  default     = true
}

variable "ssl_forced" {
  description = "Force SSL"
  type        = bool
  default     = true
}

variable "http2_support" {
  description = "Enable HTTP2 support"
  type        = bool
  default     = true
}

variable "hsts_enabled" {
  description = "Enable HSTS"
  type        = bool
  default     = false
}

variable "hsts_subdomains" {
  description = "HSTS for subdomains"
  type        = bool
  default     = false
}