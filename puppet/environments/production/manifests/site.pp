node 'pihole.tailfd9a33.ts.net' {
  include pihole
}

node 'docker.lab' {
  include tailscale
  include cloudflared
}

node default {
  include simplemodule
}
