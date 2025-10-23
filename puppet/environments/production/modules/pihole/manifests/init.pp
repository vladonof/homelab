class pihole (
  String $install_mode = 'apt',
  Optional[String] $web_password = undef,
  String $interface = 'eth0',
  Optional[String] $ipv4_address = undef,
  Optional[String] $gateway = undef,
  Array[String] $upstream_dns = ['8.8.8.8','8.8.4.4'],
  Array[String] $whitelist = [],
  Array[String] $blacklist = [],
) {

  include pihole::install
  include pihole::config
  include pihole::service

}
