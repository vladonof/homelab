## Provider Login Variables
variable "pve_token_id" {
  description = "Proxmox API Token Name."
  sensitive   = true
}

variable "pve_token_secret" {
  description = "Proxmox API Token Value."
  sensitive   = true
}

variable "pve_api_url" {
  description = "Proxmox API Endpoint, e.g. 'https://pve.example.com/api2/json'"
  type        = string
  sensitive   = true
  validation {
    condition     = can(regex("(?i)^http[s]?://.*/api2/json$", var.pve_api_url))
    error_message = "Proxmox API Endpoint Invalid. Check URL - Scheme and Path required."
  }
}

## Proxmox SSH Variables
variable "pve_user" {
  description = "Proxmox username"
  type        = string
  sensitive   = true
}

variable "pve_ssh_key_private" {
  description = "File path to private SSH key for PVE - overrides 'pve_password'"
  type        = string
  sensitive   = true
  default     = null
}

## Common Variables
variable "node" {
  description = "Name of Proxmox node to download image on, e.g. `pve`."
  type        = string
}

## Image Variables
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

## VM Variables
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
