terraform {
  required_providers {
    nginxproxymanager = {
      source  = "Sander0542/nginxproxymanager"
      version = "1.2.2"
    }
  }
}

provider "nginxproxymanager" {
  url      = "http://192.168.1.133:81"
  username = "vlad.onofrei96@gmail.com"
  password = var.nginxproxymanager_password
}