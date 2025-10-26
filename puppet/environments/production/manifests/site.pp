node 'pihole.tailfd9a33.ts.net' {
  include pihole
}

node 'docker.192.168.1.252' {
  include tailscale
}

node default {
  include simplemodule
}
