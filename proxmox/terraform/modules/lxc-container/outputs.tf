output "password" {
  value     = random_password.container_password.result
  sensitive = true
}

output "private_key" {
  value     = tls_private_key.container_key.private_key_pem
  sensitive = true
}

output "public_key" {
  value = tls_private_key.container_key.public_key_openssh
}