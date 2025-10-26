resource "nginxproxymanager_proxy_host" "host" {
  for_each = { for idx, host in var.proxy_hosts : idx => host }

  domain_names = each.value.domain_names

  forward_scheme = each.value.forward_scheme
  forward_host   = each.value.forward_host
  forward_port   = each.value.forward_port

  allow_websocket_upgrade = each.value.websocket
  block_exploits = var.block_exploits

  certificate_id = var.certificate_id

  ssl_forced      = var.ssl_forced
  http2_support   = var.http2_support
  hsts_enabled    = var.hsts_enabled
  hsts_subdomains = var.hsts_subdomains
}