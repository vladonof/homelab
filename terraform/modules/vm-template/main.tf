terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">=0.85.1"
    }
  }
}

resource "proxmox_virtual_environment_download_file" "image" {
  node_name          = var.node
  content_type       = "iso"
  datastore_id       = "local"
  file_name          = var.image_filename
  url                = var.image_url
  checksum           = var.image_checksum
  checksum_algorithm = var.image_checksum_algorithm
  overwrite          = false

  lifecycle {
    prevent_destroy = true
  }
}

resource "proxmox_virtual_environment_file" "vendor_data" {
  node_name    = var.node
  datastore_id = "local"
  content_type = "snippets"

  source_raw {
    data      = <<-EOF
      #cloud-config
      packages:
        - qemu-guest-agent
      package_update: true
      power_state:
        mode: reboot
        timeout: 30
      EOF

    file_name = "vendor-data.yaml"
  }
}

resource "proxmox_virtual_environment_vm" "vm_template" {
  depends_on = [proxmox_virtual_environment_download_file.image]

  node_name = var.node
  vm_id     = var.vm_id
  name      = var.vm_name
  bios      = var.bios
  machine   = "pc"

  # dont boot, make template
  started   = false 
  template  = true 

  agent {
    enabled = true
  }

  cpu {
    cores = 2
    type  = "host"
  }

  memory {
    dedicated = 2048
    floating  = 2048
  }

  # create an EFI disk when the bios is set to ovmf
  dynamic "efi_disk" {
    for_each = (var.bios == "ovmf" ? [1] : [])
    content {
      datastore_id      = "local-lvm"
      file_format       = "raw"
      type              = "4m"
      pre_enrolled_keys = true
    }
  }

  disk {
    file_id      = proxmox_virtual_environment_download_file.image.id
    datastore_id = "local-lvm"
    interface    = "ide0"
    size         = 8
    file_format  = "raw"
    cache        = "writeback"
    iothread     = false
    ssd          = true
    discard      = "on"
  }

  network_device {
    bridge  = "vmbr0"
    vlan_id = "1"
  }

  # cloud-init config
  initialization {
    interface           = "ide2"
    type                = "nocloud"
    vendor_data_file_id = proxmox_virtual_environment_file.vendor_data.id

    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
  }
}
