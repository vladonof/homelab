class pihole::install {
  # Only support Debian-family for now
  if $facts['os']['family'] != 'Debian' {
    fail('pihole module currently supports Debian/Ubuntu families only')
  }

  $installer_tmp = '/tmp/pihole-install.sh'
  $creates_file  = '/etc/pihole/pihole.toml'

  package { ['curl', 'sudo', 'lsb-release']:
    ensure => installed,
  }

  group { 'pihole':
    ensure => present,
    system => true,
  }

  user { 'pihole':
    ensure     => present,
    gid        => 'pihole',
    system     => true,
    managehome => false,
    shell      => '/usr/sbin/nologin',
    require    => Group['pihole'],
  }

  file { '/etc/pihole':
    ensure  => directory,
    owner   => 'pihole',
    group   => 'pihole',
    mode    => '0755',
    require => User['pihole'],
  }


  $webpassword_hash = pihole::hash_password($pihole::web_password)
  $setupvars = {
    'WEBPASSWORD' => $webpassword_hash,
  }

  $env_vars = pihole::build_env_vars($pihole::interface, $pihole::ipv4_address, $pihole::gateway, $webpassword_hash, $pihole::upstream_dns)

  file { '/etc/pihole/setupVars.conf':
    ensure  => file,
    owner   => 'pihole',
    group   => 'pihole',
    mode    => '0644',
    content => template('pihole/setupVars.conf.erb'),
  }

  exec { 'download-pihole-script':
    command => "/usr/bin/curl -sSL https://install.pi-hole.net -o ${installer_tmp}",
    creates => $installer_tmp,
    path    => ['/usr/bin','/bin','/usr/sbin','/sbin'],
    require => [Package['curl'], File['/etc/pihole/setupVars.conf']],
  }

  exec { 'pihole-install-script':
    command     => "/usr/bin/bash ${installer_tmp} --unattended",
    creates     => $creates_file,
    path        => ['/usr/bin','/bin','/usr/sbin','/sbin'],
    environment => $env_vars,
    timeout     => 0,
    require     => Exec['download-pihole-script'],
  }
}
