class pihole::service {

  service { 'pihole-FTL':
    ensure => running,
    enable => true,
    require => [Class['pihole::config']],
  }
}
