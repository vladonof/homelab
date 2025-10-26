# proxmox.tfvars
## Node Variables
node                = "proxmox"
pve_api_url         = "https://192.168.1.230:8006/api2/json"
pve_user            = "terraform"
pve_ssh_key_private = "~/.ssh/terraform_id_ed25519"

## Image Variables
image_filename           = "ubuntu-22.04-server-cloudimg-amd64.img"
image_url                = "https://cloud-images.ubuntu.com/releases/22.04/release-20240207/ubuntu-22.04-server-cloudimg-amd64.img"
image_checksum           = "80056511281dced13f2ad75108d18444c1f409a369da7294cd0c6756bb357039ccac00927a71eadb0901785acbebe4ad51be5f7a07090c0f3b6dc9a5114d2b17"
image_checksum_algorithm = "sha512"

## VM Variables
vm_id   = 9012
vm_name = "debian12"
bios    = "seabios"

