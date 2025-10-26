Tailscale Puppet module
=======================

Simple module to install the official Tailscale package on Debian/Ubuntu-family systems,
ensure the tailscaled service is enabled and running, and optionally run `tailscale up`
using an auth key provided via Hiera.

Usage
-----

- Provide an encrypted auth key in Hiera at `tailscale::auth_key` (optional). If provided,
  the module will run `tailscale up --authkey <key>` once to connect the node.
- Include the class in your node, or set via Hiera: `classes: ['tailscale']`.

Example Hiera (use eyaml to store the real encrypted value):

```yaml
tailscale::auth_key: ENC[...] # use hiera-eyaml to encrypt
```

Notes
-----

- This module targets Debian-family systems (Debian/Ubuntu). It fetches the
  distro codename via Facter/LSB (`$facts['lsb']['codename']`) and constructs
  the official Tailscale key/list URLs. If the codename isn't present, it will
  default to `stable` in the URL.
- The module uses idempotent `exec` resources with `creates`/`unless` checks for safety.

Feel free to extend this module with apt integration (puppetlabs/apt), better
GPG handling, or additional options for `tailscale up` flags.
