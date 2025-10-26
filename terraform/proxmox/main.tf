terraform {
  required_version = ">=1.5.0"
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">=0.85.1"
    }
  }
}

provider "proxmox" {
  endpoint  = var.pve_api_url
  api_token = "${var.pve_token_id}=${var.pve_token_secret}"
  insecure  = false
  ssh {
    agent       = true
    username    = var.pve_user
    private_key = var.pve_ssh_key_private
  }
}

module "vm_template" {
  source = "./../modules/vm-template"

  node                     = var.node
  vm_id                    = var.vm_id
  vm_name                  = var.vm_name
  bios                     = var.bios
  image_filename           = var.image_filename
  image_url                = var.image_url
  image_checksum           = var.image_checksum
  image_checksum_algorithm = var.image_checksum_algorithm
}

resource "proxmox_virtual_environment_file" "pihole_user_data" {
  node_name    = var.node
  datastore_id = "local"
  content_type = "snippets"

  source_file {
    path = "${path.module}/snippets/pihole-user-data.yaml"
  }
}

resource "proxmox_virtual_environment_file" "pihole_puppet_user_data" {
  node_name    = var.node
  datastore_id = "local"
  content_type = "snippets"

  source_file {
    path = "${path.module}/snippets/pihole-puppet-user-data.yaml"
  }
}

resource "proxmox_virtual_environment_file" "generic_user_data" {
  node_name    = var.node
  datastore_id = "local"
  content_type = "snippets"

  source_file {
    path = "${path.module}/snippets/generic-user-data.yaml"
  }
}

resource "proxmox_virtual_environment_file" "torrent_user_data" {
  node_name    = var.node
  datastore_id = "local"
  content_type = "snippets"

  source_file {
    path = "${path.module}/snippets/torrent-user-data.yaml"
  }
}

resource "proxmox_virtual_environment_file" "docker_user_data" {
  node_name    = var.node
  datastore_id = "local"
  content_type = "snippets"

  source_file {
    path = "${path.module}/snippets/docker-user-data.yaml"
  }
}

resource "proxmox_virtual_environment_file" "jellyfin_user_data" {
  node_name    = var.node
  datastore_id = "local"
  content_type = "snippets"

  source_file {
    path = "${path.module}/snippets/jellyfin-user-data.yaml"
  }
}

resource "proxmox_virtual_environment_file" "kuma_user_data" {
  node_name    = var.node
  datastore_id = "local"
  content_type = "snippets"

  source_file {
    path = "${path.module}/snippets/kuma-user-data.yaml"
  }
}

module "vm_puppet_server" {
  source = "github.com/trfore/terraform-bpg-proxmox//modules/vm-clone"

  vcpu      = 2
  vcpu_type = "host"
  memory    = 4096

  node            = "proxmox"
  vm_id           = 103
  vm_name         = "puppet"
  template_id     = module.vm_template.template_id
  ci_ssh_key      = "~/.ssh/terraform_id_ed25519.pub"
  ci_user_data    = proxmox_virtual_environment_file.generic_user_data.id
  ci_ipv4_cidr    = "192.168.1.253/24"
  ci_ipv4_gateway = "192.168.1.1"
}

module "vm_pihole" {
  source = "github.com/trfore/terraform-bpg-proxmox//modules/vm-clone"

  vcpu      = 1
  vcpu_type = "host"
  memory    = 2048

  node            = "proxmox"
  vm_id           = 104
  vm_name         = "pihole"
  template_id     = module.vm_template.template_id
  ci_ssh_key      = "~/.ssh/terraform_id_ed25519.pub"
  ci_user_data    = proxmox_virtual_environment_file.pihole_puppet_user_data.id
  ci_ipv4_cidr    = "192.168.1.252/24"
  ci_ipv4_gateway = "192.168.1.1"
}