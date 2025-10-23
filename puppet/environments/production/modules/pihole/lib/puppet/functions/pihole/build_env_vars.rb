Puppet::Functions.create_function('pihole::build_env_vars') do
  dispatch :build_env_vars do
    param 'String', :interface
    param 'Optional[String]', :ipv4_address
    param 'Optional[String]', :gateway
    param 'Optional[String]', :web_password
    param 'Array[String]', :upstream_dns
  end

  def build_env_vars(interface, ipv4_address, gateway, web_password, upstream_dns)
    env_hash = { 
      'PIHOLE_INTERFACE' => interface,
      'PIHOLE_SKIP_OS_CHECK' => 'true'
    }
    env_hash['PIHOLE_IPV4_ADDRESS'] = ipv4_address if ipv4_address
    env_hash['PIHOLE_GATEWAY'] = gateway if gateway
    env_hash['WEBPASSWORD'] = web_password if web_password
    env_hash['PIHOLE_DNS_1'] = upstream_dns[0] if upstream_dns.size >= 1
    env_hash['PIHOLE_DNS_2'] = upstream_dns[1] if upstream_dns.size >= 2
    env_hash.map { |k, v| "#{k}=#{v}" }
  end
end