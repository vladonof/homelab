terraform {
  required_providers {
    nginxproxymanager = {
      source  = "Sander0542/nginxproxymanager"
      version = "1.2.2"
    }
  }
}

provider "nginxproxymanager" {
  url      = "https://ext-homelab.vladonof.dev"
  username = "vlad.onofrei96@gmail.com"
  password = var.nginxproxymanager_password
}