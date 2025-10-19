## Structure

- `playbooks/` — Individual playbooks for each domain (e.g., pihole, torrent)
- `inventory.yaml` — Main inventory file defining host groups and hosts
- `inventory/` — Additional inventory files (e.g., `inventory/inventory.yaml`)
- `requirements.yml` — Ansible Galaxy requirements
- `templates/` — Jinja2 templates for configuration files

## Usage

Run a playbook against a host group:

```sh
ansible-playbook -i inventory.yaml playbooks/pihole.yaml
```

Or using the inventory directory:

```sh
ansible-playbook -i inventory/inventory.yaml playbooks/torrent.yaml
```