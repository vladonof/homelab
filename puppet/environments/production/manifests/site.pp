node 'pihole.tailfd9a33.ts.net' {
  include pihole
}

node 'external.tailfd9a33.ts.net' {
  include tailscale
}

node default {
  include simplemodule
}
