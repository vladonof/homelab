class cloudflared (
  String $tunnel_name = lookup('cloudflared::tunnel_name'),
  String $tunnel_id = lookup('cloudflared::tunnel_id'),
  String $credentials_file = lookup('cloudflared::credentials_file'),
  String $credentials_content = lookup('cloudflared::credentials_content'),
  String $hostname = lookup('cloudflared::hostname'),
  String $service = lookup('cloudflared::service'),
) {

  # Download cloudflared
  exec { 'download_cloudflared':
    command => '/usr/bin/wget -O /tmp/cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb',
    creates => '/tmp/cloudflared.deb',
  }

  # Install cloudflared
  exec { 'install_cloudflared':
    command => '/usr/bin/dpkg -i /tmp/cloudflared.deb',
    unless  => '/usr/bin/dpkg -l cloudflared',
    require => Exec['download_cloudflared'],
  }

  # Credentials file
  file { $credentials_file:
    ensure  => file,
    content => $credentials_content,
    mode    => '0600',
    require => Exec['install_cloudflared'],
  }

  # Create tunnel (requires manual login first)
  exec { 'create_cloudflared_tunnel':
    command => "/usr/bin/cloudflared tunnel create ${tunnel_name}",
    unless  => "/usr/bin/cloudflared tunnel list | grep ${tunnel_name}",
    require => Exec['install_cloudflared'],
  }
  # Ensure /etc/cloudflared directory exists
  file { '/etc/cloudflared':
    ensure => directory,
    mode   => '0755',
  }

  # Config file
  file { '/etc/cloudflared/config.yaml':
    ensure  => file,
    content => template('cloudflared/config.yaml.erb'),
    require => [File['/etc/cloudflared'], Exec['install_cloudflared'], Exec['create_cloudflared_tunnel'], File[$credentials_file]],
  }
  # Install systemd service for cloudflared if not present
  exec { 'install_cloudflared_service':
    command => '/usr/bin/cloudflared service install',
    unless  => '/bin/systemctl status cloudflared.service',
    require => Exec['install_cloudflared'],
  }

  # Service
  service { 'cloudflared':
    ensure  => running,
    enable  => true,
    require => [File['/etc/cloudflared/config.yaml'], Exec['install_cloudflared_service']],
  }
}
