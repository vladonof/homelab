resource "portainer_custom_template" "audiobookshelf" {
  title        = "Audiobookshelf"
  description  = "Docker Compose template for Audiobookshelf"
  file_content = file("${path.module}/dockerfiles/audiobookshelf.docker-compose.yml")
  note         = "Docker Compose template for Audiobookshelf"
  platform     = 1
  type         = 2
}

resource "portainer_custom_template" "authentik" {
  title        = "Authentik"
  description  = "Docker Compose template for Authentik"
  file_content = file("${path.module}/dockerfiles/authenetik.docker-compose.yml")
  note         = "Docker Compose template for Authentik"
  platform     = 1
  type         = 2
}

resource "portainer_custom_template" "metrics" {
  title        = "Metrics"
  description  = "Docker Compose template for Metrics"
  file_content = file("${path.module}/dockerfiles/metrics.docker-compose.yaml")
  note         = "Docker Compose template for Metrics"
  platform     = 1
  type         = 2
}

resource "portainer_custom_template" "nginxproxymanager" {
  title        = "Nginx Proxy Manager"
  description  = "Docker Compose template for Nginx Proxy Manager"
  file_content = file("${path.module}/dockerfiles/nginxproxymanager.docker-compose.yml")
  note         = "Docker Compose template for Nginx Proxy Manager"
  platform     = 1
  type         = 2
}

resource "portainer_custom_template" "qbittorrent" {
  title        = "qBittorrent"
  description  = "Docker Compose template for qBittorrent"
  file_content = file("${path.module}/dockerfiles/qbittorrent.docker-compose.yml")
  note         = "Docker Compose template for qBittorrent"
  platform     = 1
  type         = 2
}

resource "portainer_custom_template" "arr" {
  title        = "MediaServer"
  description  = "Docker Compose template for Arr Stack"
  file_content = file("${path.module}/dockerfiles/arr.docker-compose.yml")
  note         = "gluetun, qbittorrent, radarr, sonarr, lidarr, prowlarr, overseerr, homarr"
  platform     = 1
  type         = 2
}
