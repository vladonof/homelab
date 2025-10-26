terraform {
  required_providers {
    portainer = {
      source = "portainer/portainer"
    }
  }
}

provider "portainer" {
  endpoint = "https://portainer.homelab.vladonof.dev"
  api_key  = var.portainer_api_key
}