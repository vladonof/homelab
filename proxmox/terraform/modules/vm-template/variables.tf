variable "node" {
  description = "Name of Proxmox node to download image on, e.g. `pve`."
  type        = string
}

variable "vm_id" {
  description = "ID number for new VM."
  type        = number
}

variable "vm_name" {
  description = "Name, must be alphanumeric (may contain dash: `-`). Defaults to PVE naming, `VM <VM_ID>`."
  type        = string
  default     = null
}

variable "bios" {
  description = "VM bios, setting to `ovmf` will automatically create a EFI disk."
  type        = string
  default     = "seabios"
  validation {
    condition     = contains(["seabios", "ovmf"], var.bios)
    error_message = "Invalid bios setting: ${var.bios}. Valid options: 'seabios' or 'ovmf'."
  }
}

variable "image_filename" {
  description = "Filename, default `null` will extract name from URL."
  type        = string
  default     = null
}

variable "image_url" {
  description = "Image URL."
  type        = string
}

variable "image_checksum" {
  description = "Image checksum value."
  type        = string
}

variable "image_checksum_algorithm" {
  description = "Image checksum algorithm."
  type        = string
  default     = "sha256"
}
