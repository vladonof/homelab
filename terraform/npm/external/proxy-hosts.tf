module "proxy_hosts" {
  source = "./../../modules/proxy-host"

  proxy_hosts = [
    {
      domain_names   = ["overseerr.ext-homelab.vladonof.dev"]
      forward_scheme = "http"
      forward_host   = "100.95.15.25"
      forward_port   = 194
      websocket      = false
    },
    {
      domain_names   = ["prowlarr.ext-homelab.vladonof.dev"]
      forward_scheme = "http"
      forward_host   = "100.95.15.25"
      forward_port   = 195
      websocket      = false
    },
    {
      domain_names   = ["sonarr.ext-homelab.vladonof.dev"]
      forward_scheme = "http"
      forward_host   = "100.95.15.25"
      forward_port   = 197
      websocket      = false
    },
    {
      domain_names   = ["radarr.ext-homelab.vladonof.dev"]
      forward_scheme = "http"
      forward_host   = "100.95.15.25"
      forward_port   = 198
      websocket      = false
    },
    {
      domain_names   = ["torrent.ext-homelab.vladonof.dev"]
      forward_scheme = "http"
      forward_host   = "100.95.15.25"
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
          proxy_pass http://100.95.15.25:86;
        }
      EOT
    },
    # {
    #   domain_names   = ["audiobookshelf.ext-homelab.vladonof.dev"]
    #   forward_scheme = "http"
    #   forward_host   = "100.95.15.25"
    #   forward_port   = 85
    #   websocket      = true
    # },
    {
      domain_names   = ["cadvisor.ext-homelab.vladonof.dev"]
      forward_scheme = "http"
      forward_host   = "100.95.15.25"
      forward_port   = 84
      websocket      = true
    },
    {
      domain_names   = ["grafana.ext-homelab.vladonof.dev"]
      forward_scheme = "http"
      forward_host   = "100.95.15.25"
      forward_port   = 83
      websocket      = true
    },
    {
      domain_names   = ["pihole.ext-homelab.vladonof.dev"]
      forward_scheme = "https"
      forward_host   = "192.168.1.252"
      forward_port   = 443
      websocket      = true
    },
    {
      domain_names   = ["portainer.ext-homelab.vladonof.dev"]
      forward_scheme = "https"
      forward_host   = "100.95.15.25"
      forward_port   = 9443
      websocket      = true
    },
    {
      domain_names   = ["prometheus.ext-homelab.vladonof.dev"]
      forward_scheme = "http"
      forward_host   = "100.95.15.25"
      forward_port   = 9090
      websocket      = true
    },
    # {
    #   domain_names   = ["authentik.ext-homelab.vladonof.dev"]
    #   forward_scheme = "http"
    #   forward_host   = "100.95.15.25"
    #   forward_port   = 82
    #   websocket      = true
    # },
    # {
    #   domain_names   = ["ext-homelab.vladonof.dev"]
    #   forward_scheme = "http"
    #   forward_host   = "100.95.15.25"
    #   forward_port   = 81
    #   websocket      = false
    # },
    {
      domain_names   = ["proxmox.ext-homelab.vladonof.dev"]
      forward_scheme = "https"
      forward_host   = "192.168.1.230"
      forward_port   = 8006
      websocket      = true
    },
    {
      domain_names   = ["plex.ext-homelab.vladonof.dev"]
      forward_scheme = "http"
      forward_host   = "100.95.15.25"
      forward_port   = 32400
      websocket      = false
    },
    {
      domain_names   = ["tautulli.ext-homelab.vladonof.dev"]
      forward_scheme = "http"
      forward_host   = "100.95.15.25"
      forward_port   = 196
      websocket      = false
    },
    {
      domain_names   = ["smokeping.ext-homelab.vladonof.dev"]
      forward_scheme = "http"
      forward_host   = "100.95.15.25"
      forward_port   = 87
      websocket      = false
    },
    {
      domain_names   = ["homepage.ext-homelab.vladonof.dev"]
      forward_scheme = "http"
      forward_host   = "100.95.15.25"
      forward_port   = 88
      websocket      = false
    },
    {
      domain_names   = ["myspeed.ext-homelab.vladonof.dev"]
      forward_scheme = "http"
      forward_host   = "100.95.15.25"
      forward_port   = 79
      websocket      = false
    },
    {
      domain_names   = ["readarr.ext-homelab.vladonof.dev"]
      forward_scheme = "http"
      forward_host   = "100.95.15.25"
      forward_port   = 193
      websocket      = false
    } 
  ]


  certificate_id = 1
}