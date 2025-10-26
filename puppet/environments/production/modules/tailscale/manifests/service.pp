class tailscale::service {
  service { 'tailscaled':
    ensure  => running,
    enable  => true,
    require => Package['tailscale'],
  }
}
