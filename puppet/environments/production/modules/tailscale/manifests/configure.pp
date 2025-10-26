class tailscale::configure(
  String $auth_key,
){
  exec { 'tailscale-up':
    command => "/usr/bin/tailscale up --authkey ${auth_key}",
    path    => ['/usr/bin','/bin'],
    unless  => '/usr/bin/tailscale ip -4 >/dev/null 2>&1',
    require => Service['tailscaled'],
  }
}
