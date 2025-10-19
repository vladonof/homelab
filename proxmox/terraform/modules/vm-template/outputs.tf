output "template_id" {
  description = "The ID of the created VM template"
  value       = proxmox_virtual_environment_vm.vm_template.vm_id
}

output "template_name" {
  description = "The name of the created VM template"
  value       = proxmox_virtual_environment_vm.vm_template.name
}