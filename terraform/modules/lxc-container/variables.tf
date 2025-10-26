variable "node_name" {
  type = string
}

variable "vm_id" {
  type = number
}

variable "unprivileged" {
  type = bool
}

variable "cpu_cores" {
  type = number
}

variable "memory_dedicated" {
  type = number
}

variable "disk_size" {
  type = number
}

variable "disk_datastore_id" {
  type = string
}

variable "hostname" {
  type = string
}

variable "ipv4_address" {
  type = string
}

variable "ipv4_gateway" {
  type = string
}

variable "template_file_id" {
  type = string
}

variable "network_name" {
  type = string
}

variable "network_bridge" {
  type = string
}

variable "password_length" {
  type = number
}

variable "password_override_special" {
  type = string
}

variable "password_special" {
  type = bool
}

variable "key_algorithm" {
  type = string
}

variable "key_rsa_bits" {
  type = number
}

variable "os_type" {
  type = string
}