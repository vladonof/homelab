class tailscale(
  Optional[String] $auth_key = lookup('tailscale::auth_key', String, 'first', undef),
){
  include tailscale::install
  include tailscale::service

  if $auth_key {
    class { 'tailscale::configure':
      auth_key => $auth_key,
    }
  }
}
