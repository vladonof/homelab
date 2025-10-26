class tailscale::install {
  $os_name    = $facts['os']['name']
  $os_codename = $facts['os']['distro']['codename']

  if $os_name != 'Debian' or $os_codename != 'bookworm' {
    fail("tailscale module supports only Debian bookworm. Detected: ${os_name} ${os_codename}")
  }

  notice("Detected Debian bookworm via facts: ${os_name} ${os_codename}")

  $key_url  = "https://pkgs.tailscale.com/stable/debian/bookworm.noarmor.gpg"
  $list_url = "https://pkgs.tailscale.com/stable/debian/bookworm.tailscale-keyring.list"

  package { ['curl', 'lsb-release']:
    ensure => installed,
  }

  exec { 'tailscale-add-key':
    command => "/usr/bin/curl -fsSL ${key_url} | /usr/bin/tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null",
    path    => ['/usr/bin','/bin'],
    creates => '/usr/share/keyrings/tailscale-archive-keyring.gpg',
    require => Package['curl'],
  }

  exec { 'tailscale-add-list':
    command => "/usr/bin/curl -fsSL ${list_url} | /usr/bin/tee /etc/apt/sources.list.d/tailscale.list >/dev/null",
    path    => ['/usr/bin','/bin'],
    creates => '/etc/apt/sources.list.d/tailscale.list',
    require => Exec['tailscale-add-key'],
    notify  => Exec['tailscale-apt-update'],
  }

  exec { 'tailscale-apt-update':
    command     => '/usr/bin/apt-get update',
    path        => ['/usr/bin','/bin'],
    refreshonly => true,
    subscribe   => Exec['tailscale-add-list'],
  }

  package { 'tailscale':
    ensure  => installed,
    require => [Exec['tailscale-apt-update'], Exec['tailscale-add-list']],
  }
}
