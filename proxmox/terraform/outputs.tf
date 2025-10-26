output "password" {
  value     = module.lxc_external.password
  sensitive = true
}

output "private_key" {
  value     = module.lxc_external.private_key
  sensitive = true
}

output "public_key" {
  value = module.lxc_external.public_key
}