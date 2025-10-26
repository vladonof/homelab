terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">=0.85.1"
    }
  }
}

resource "random_password" "container_password" {
  length           = var.password_length
  override_special = var.password_override_special
  special          = var.password_special
}

resource "tls_private_key" "container_key" {
  algorithm = var.key_algorithm
  rsa_bits  = var.key_rsa_bits
}

resource "proxmox_virtual_environment_container" "container" {
  node_name    = var.node_name
  vm_id        = var.vm_id
  unprivileged = var.unprivileged

  cpu {
    cores = var.cpu_cores
  }

  memory {
    dedicated = var.memory_dedicated
  }

  disk {
    size         = var.disk_size
    datastore_id = var.disk_datastore_id
  }

  initialization {
    hostname = var.hostname

    ip_config {
      ipv4 {
        address = var.ipv4_address
        gateway = var.ipv4_gateway
      }
    }

    dns {
      servers = ["192.168.1.252"]
    }

    user_account {
      keys = [
        trimspace(tls_private_key.container_key.public_key_openssh)
      ]
      password = ""
    }
  }

  operating_system {
    template_file_id = var.template_file_id
    type = var.os_type
  }

  network_interface {
    name   = var.network_name
    bridge = var.network_bridge
  }
}