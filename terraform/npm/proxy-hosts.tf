module "proxy_hosts" {
  source = "./../modules/proxy-host"

  proxy_hosts = [
    {
      domain_names   = ["overseerr.homelab.vladonof.dev"]
      forward_scheme = "http"
      forward_host   = "192.168.1.133"
      forward_port   = 194
      websocket      = false
    },
    {
      domain_names   = ["prowlarr.homelab.vladonof.dev"]
      forward_scheme = "http"
      forward_host   = "192.168.1.133"
      forward_port   = 195
      websocket      = false
    },
    {
      domain_names   = ["sonarr.homelab.vladonof.dev"]
      forward_scheme = "http"
      forward_host   = "192.168.1.133"
      forward_port   = 197
      websocket      = false
    },
    {
      domain_names   = ["radarr.homelab.vladonof.dev"]
      forward_scheme = "http"
      forward_host   = "192.168.1.133"
      forward_port   = 198
      websocket      = false
    },
    {
      domain_names   = ["torrent.homelab.vladonof.dev"]
      forward_scheme = "http"
      forward_host   = "192.168.1.133"
      forward_port   = 86
      websocket      = true
      advanced_config = <<-EOT
        location / {
          proxy_set_header Host $host;
          proxy_set_header X-Forwarded-Host $host;
          proxy_set_header X-Forwarded-Proto $scheme;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_buffering off;
          proxy_pass http://192.168.1.133:86;
        }
      EOT
    },
    {
      domain_names   = ["audiobookshelf.homelab.vladonof.dev"]
      forward_scheme = "http"
      forward_host   = "192.168.1.133"
      forward_port   = 85
      websocket      = true
    },
    {
      domain_names   = ["cadvisor.homelab.vladonof.dev"]
      forward_scheme = "http"
      forward_host   = "192.168.1.133"
      forward_port   = 84
      websocket      = true
    },
    {
      domain_names   = ["grafana.homelab.vladonof.dev"]
      forward_scheme = "http"
      forward_host   = "192.168.1.133"
      forward_port   = 83
      websocket      = true
    },
    {
      domain_names   = ["pihole.homelab.vladonof.dev"]
      forward_scheme = "https"
      forward_host   = "192.168.1.252"
      forward_port   = 443
      websocket      = true
    },
    {
      domain_names   = ["portainer.homelab.vladonof.dev"]
      forward_scheme = "https"
      forward_host   = "192.168.1.133"
      forward_port   = 9443
      websocket      = true
    },
    {
      domain_names   = ["prometheus.homelab.vladonof.dev"]
      forward_scheme = "http"
      forward_host   = "192.168.1.133"
      forward_port   = 9090
      websocket      = true
    },
    {
      domain_names   = ["authentik.homelab.vladonof.dev"]
      forward_scheme = "http"
      forward_host   = "192.168.1.133"
      forward_port   = 82
      websocket      = true
    },
    {
      domain_names   = ["homelab.vladonof.dev"]
      forward_scheme = "http"
      forward_host   = "192.168.1.133"
      forward_port   = 81
      websocket      = false
    },
    {
      domain_names   = ["proxmox.homelab.vladonof.dev"]
      forward_scheme = "https"
      forward_host   = "192.168.1.230"
      forward_port   = 8006
      websocket      = true
    },
    {
      domain_names   = ["plex.homelab.vladonof.dev"]
      forward_scheme = "http"
      forward_host   = "192.168.1.133"
      forward_port   = 32400
      websocket      = false
    },
    {
      domain_names   = ["tautulli.homelab.vladonof.dev"]
      forward_scheme = "http"
      forward_host   = "192.168.1.133"
      forward_port   = 196
      websocket      = false
    },
    {
      domain_names   = ["smokeping.homelab.vladonof.dev"]
      forward_scheme = "http"
      forward_host   = "192.168.1.133"
      forward_port   = 87
      websocket      = false
    },
    {
      domain_names   = ["homepage.homelab.vladonof.dev"]
      forward_scheme = "http"
      forward_host   = "192.168.1.133"
      forward_port   = 88
      websocket      = false
    }
  ]

  certificate_id = nginxproxymanager_certificate_letsencrypt.certificate.id
}

resource "nginxproxymanager_certificate_letsencrypt" "certificate" {
  domain_names = ["homelab.vladonof.dev", "*.homelab.vladonof.dev"]

  letsencrypt_email = "vlad.onofrei96@gmail.com"
  letsencrypt_agree = true

  dns_challenge            = true
  dns_provider             = "cloudflare"
  dns_provider_credentials = "dns_cloudflare_api_token=${var.dns_cloudflare_api_token}"

  lifecycle {
    ignore_changes = [dns_provider_credentials, propagation_seconds]
  }
}