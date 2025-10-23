class pihole::config {

# Lookup pihole configuration from Hiera
  $pihole_blocklist = lookup('pihole_blocklist', Array, 'first')
  $pihole_domainlist = lookup('pihole_domainlist', Array, 'first')
  $pihole_upstreams = lookup('pihole::upstream_dns', Array, 'first')
  $pihole_dns_cnamedeepinspect = lookup('pihole_dns_cnamedeepinspect', Boolean, 'first')
  $pihole_dns_blockesni = lookup('pihole_dns_blockesni', Boolean, 'first')
  $pihole_dns_edns0ecs = lookup('pihole_dns_edns0ecs', Boolean, 'first')
  $pihole_dns_ignorelocalhost = lookup('pihole_dns_ignorelocalhost', Boolean, 'first')
  $pihole_dns_showdnssec = lookup('pihole_dns_showdnssec', Boolean, 'first')
  $pihole_dns_analyzeonlyaandaaaa = lookup('pihole_dns_analyzeonlyaandaaaa', Boolean, 'first')
  $pihole_dns_piholeptr = lookup('pihole_dns_piholeptr', String, 'first')
  $pihole_dns_replywhenbusy = lookup('pihole_dns_replywhenbusy', String, 'first')
  $pihole_dns_blockttl = lookup('pihole_dns_blockttl', String, 'first')
  $pihole_dns_hosts = lookup('pihole_dns_hosts', Array, 'first')
  $pihole_dns_domainneeded = lookup('pihole_dns_domainneeded', Boolean, 'first')
  $pihole_dns_expandhosts = lookup('pihole_dns_expandhosts', Boolean, 'first')
  $pihole_dns_domain = lookup('pihole_dns_domain', String, 'first')
  $pihole_dns_boguspriv = lookup('pihole_dns_boguspriv', Boolean, 'first')
  $pihole_dns_dnssec = lookup('pihole_dns_dnssec', Boolean, 'first')
  $pihole_dns_interface = lookup('pihole_dns_interface', String, 'first')
  $pihole_dns_hostrecord = lookup('pihole_dns_hostrecord', String, 'first')
  $pihole_dns_listeningmode = lookup('pihole_dns_listeningmode', String, 'first')
  $pihole_dns_querylogging = lookup('pihole_dns_querylogging', Boolean, 'first')
  $pihole_dns_cnamerecords = lookup('pihole_dns_cnamerecords', Array, 'first')
  $pihole_dns_port = lookup('pihole_dns_port', String, 'first')
  $pihole_dns_revservers = lookup('pihole_dns_revservers', Array, 'first')
  $pihole_dns_cache_size = lookup('pihole_dns_cache_size', String, 'first')
  $pihole_dns_cache_optimizer = lookup('pihole_dns_cache_optimizer', String, 'first')
  $pihole_dns_cache_upstreamblockedttl = lookup('pihole_dns_cache_upstreamblockedttl', String, 'first')
  $pihole_dns_blocking_active = lookup('pihole_dns_blocking_active', Boolean, 'first')
  $pihole_dns_blocking_mode = lookup('pihole_dns_blocking_mode', String, 'first')
  $pihole_dns_blocking_edns = lookup('pihole_dns_blocking_edns', String, 'first')
  $pihole_dns_specialdomains_mozillacanary = lookup('pihole_dns_specialdomains_mozillacanary', Boolean, 'first')
  $pihole_dns_specialdomains_icloudprivaterelay = lookup('pihole_dns_specialdomains_icloudprivaterelay', Boolean, 'first')
  $pihole_dns_specialdomains_designatedresolver = lookup('pihole_dns_specialdomains_designatedresolver', Boolean, 'first')
  $pihole_dns_reply_host_force4 = lookup('pihole_dns_reply_host_force4', Boolean, 'first')
  $pihole_dns_reply_host_ipv4 = lookup('pihole_dns_reply_host_ipv4', String, 'first')
  $pihole_dns_reply_host_force6 = lookup('pihole_dns_reply_host_force6', Boolean, 'first')
  $pihole_dns_reply_host_ipv6 = lookup('pihole_dns_reply_host_ipv6', String, 'first')
  $pihole_dns_reply_blocking_force4 = lookup('pihole_dns_reply_blocking_force4', Boolean, 'first')
  $pihole_dns_reply_blocking_ipv4 = lookup('pihole_dns_reply_blocking_ipv4', String, 'first')
  $pihole_dns_reply_blocking_force6 = lookup('pihole_dns_reply_blocking_force6', Boolean, 'first')
  $pihole_dns_reply_blocking_ipv6 = lookup('pihole_dns_reply_blocking_ipv6', String, 'first')
  $pihole_dns_ratelimit_count = lookup('pihole_dns_ratelimit_count', String, 'first')
  $pihole_dns_ratelimit_interval = lookup('pihole_dns_ratelimit_interval', String, 'first')

  # DHCP
  $pihole_dhcp_active = lookup('pihole_dhcp_active', Boolean, 'first')
  $pihole_dhcp_start = lookup('pihole_dhcp_start', String, 'first')
  $pihole_dhcp_end = lookup('pihole_dhcp_end', String, 'first')
  $pihole_dhcp_router = lookup('pihole_dhcp_router', String, 'first')
  $pihole_dhcp_netmask = lookup('pihole_dhcp_netmask', String, 'first')
  $pihole_dhcp_leasetime = lookup('pihole_dhcp_leasetime', String, 'first')
  $pihole_dhcp_ipv6 = lookup('pihole_dhcp_ipv6', Boolean, 'first')
  $pihole_dhcp_rapidcommit = lookup('pihole_dhcp_rapidcommit', Boolean, 'first')
  $pihole_dhcp_multidns = lookup('pihole_dhcp_multidns', Boolean, 'first')
  $pihole_dhcp_logging = lookup('pihole_dhcp_logging', Boolean, 'first')
  $pihole_dhcp_ignoreunknownclients = lookup('pihole_dhcp_ignoreunknownclients', Boolean, 'first')
  $pihole_dhcp_hosts = lookup('pihole_dhcp_hosts', Array, 'first')

  # NTP
  $pihole_ntp_ipv4_active = lookup('pihole_ntp_ipv4_active', Boolean, 'first')
  $pihole_ntp_ipv4_address = lookup('pihole_ntp_ipv4_address', String, 'first')
  $pihole_ntp_ipv6_active = lookup('pihole_ntp_ipv6_active', Boolean, 'first')
  $pihole_ntp_ipv6_address = lookup('pihole_ntp_ipv6_address', String, 'first')
  $pihole_ntp_sync_active = lookup('pihole_ntp_sync_active', Boolean, 'first')
  $pihole_ntp_sync_server = lookup('pihole_ntp_sync_server', String, 'first')
  $pihole_ntp_sync_interval = lookup('pihole_ntp_sync_interval', String, 'first')
  $pihole_ntp_sync_count = lookup('pihole_ntp_sync_count', String, 'first')
  $pihole_ntp_sync_rtc_set = lookup('pihole_ntp_sync_rtc_set', Boolean, 'first')
  $pihole_ntp_sync_rtc_device = lookup('pihole_ntp_sync_rtc_device', String, 'first')
  $pihole_ntp_sync_rtc_utc = lookup('pihole_ntp_sync_rtc_utc', Boolean, 'first')

  # Resolver
  $pihole_resolver_resolveipv4 = lookup('pihole_resolver_resolveipv4', Boolean, 'first')
  $pihole_resolver_resolveipv6 = lookup('pihole_resolver_resolveipv6', Boolean, 'first')
  $pihole_resolver_networknames = lookup('pihole_resolver_networknames', Boolean, 'first')
  $pihole_resolver_refreshnames = lookup('pihole_resolver_refreshnames', String, 'first')

  # Database
  $pihole_database_dbimport = lookup('pihole_database_dbimport', Boolean, 'first')
  $pihole_database_maxdbdays = lookup('pihole_database_maxdbdays', String, 'first')
  $pihole_database_dbinterval = lookup('pihole_database_dbinterval', String, 'first')
  $pihole_database_usewal = lookup('pihole_database_usewal', Boolean, 'first')
  $pihole_database_network_parsearpcache = lookup('pihole_database_network_parsearpcache', Boolean, 'first')
  $pihole_database_network_expire = lookup('pihole_database_network_expire', String, 'first')

  # Webserver
  $pihole_webserver_domain = lookup('pihole_webserver_domain', String, 'first')
  $pihole_webserver_acl = lookup('pihole_webserver_acl', String, 'first')
  $pihole_webserver_port = lookup('pihole_webserver_port', String, 'first')
  $pihole_webserver_threads = lookup('pihole_webserver_threads', String, 'first')
  $pihole_webserver_headers = lookup('pihole_webserver_headers', Array, 'first')
  $pihole_webserver_serve_all = lookup('pihole_webserver_serve_all', Boolean, 'first')
  $pihole_webserver_session_timeout = lookup('pihole_webserver_session_timeout', String, 'first')
  $pihole_webserver_session_restore = lookup('pihole_webserver_session_restore', Boolean, 'first')
  $pihole_webserver_tls_cert = lookup('pihole_webserver_tls_cert', String, 'first')
  $pihole_webserver_paths_webroot = lookup('pihole_webserver_paths_webroot', String, 'first')
  $pihole_webserver_paths_webhome = lookup('pihole_webserver_paths_webhome', String, 'first')
  $pihole_webserver_paths_prefix = lookup('pihole_webserver_paths_prefix', String, 'first')
  $pihole_webserver_interface_boxed = lookup('pihole_webserver_interface_boxed', Boolean, 'first')
  $pihole_webserver_interface_theme = lookup('pihole_webserver_interface_theme', String, 'first')
  $pihole_webserver_api_max_sessions = lookup('pihole_webserver_api_max_sessions', String, 'first')
  $pihole_webserver_api_prettyjson = lookup('pihole_webserver_api_prettyjson', Boolean, 'first')
  $pihole_webserver_api_pwhash = pihole::hash_password($pihole::web_password)
  $pihole_webserver_api_totp_secret = lookup('pihole_webserver_api_totp_secret', String, 'first')
  $pihole_webserver_api_app_pwhash = lookup('pihole_webserver_api_app_pwhash', String, 'first')
  $pihole_webserver_api_app_sudo = lookup('pihole_webserver_api_app_sudo', Boolean, 'first')
  $pihole_webserver_api_cli_pw = lookup('pihole_webserver_api_cli_pw', Boolean, 'first')
  $pihole_webserver_api_excludeclients = lookup('pihole_webserver_api_excludeclients', Array, 'first')
  $pihole_webserver_api_excludedomains = lookup('pihole_webserver_api_excludedomains', Array, 'first')
  $pihole_webserver_api_maxhistory = lookup('pihole_webserver_api_maxhistory', String, 'first')
  $pihole_webserver_api_maxclients = lookup('pihole_webserver_api_maxclients', String, 'first')
  $pihole_webserver_api_client_history_global_max = lookup('pihole_webserver_api_client_history_global_max', Boolean, 'first')
  $pihole_webserver_api_allow_destructive = lookup('pihole_webserver_api_allow_destructive', Boolean, 'first')
  $pihole_webserver_api_temp_limit = lookup('pihole_webserver_api_temp_limit', String, 'first')
  $pihole_webserver_api_temp_unit = lookup('pihole_webserver_api_temp_unit', String, 'first')

  # Files
  $pihole_files_pid = lookup('pihole_files_pid', String, 'first')
  $pihole_files_database = lookup('pihole_files_database', String, 'first')
  $pihole_files_gravity = lookup('pihole_files_gravity', String, 'first')
  $pihole_files_gravity_tmp = lookup('pihole_files_gravity_tmp', String, 'first')
  $pihole_files_macvendor = lookup('pihole_files_macvendor', String, 'first')
  $pihole_files_setupvars = lookup('pihole_files_setupvars', String, 'first')
  $pihole_files_pcap = lookup('pihole_files_pcap', String, 'first')
  $pihole_files_log_ftl = lookup('pihole_files_log_ftl', String, 'first')
  $pihole_files_log_dnsmasq = lookup('pihole_files_log_dnsmasq', String, 'first')
  $pihole_files_log_webserver = lookup('pihole_files_log_webserver', String, 'first')

  # Misc
  $pihole_misc_privacylevel = lookup('pihole_misc_privacylevel', String, 'first')
  $pihole_misc_delay_startup = lookup('pihole_misc_delay_startup', String, 'first')
  $pihole_misc_nice = lookup('pihole_misc_nice', String, 'first')
  $pihole_misc_addr2line = lookup('pihole_misc_addr2line', Boolean, 'first')
  $pihole_misc_etc_dnsmasq_d = lookup('pihole_misc_etc_dnsmasq_d', Boolean, 'first')
  $pihole_misc_dnsmasq_lines = lookup('pihole_misc_dnsmasq_lines', Array, 'first')
  $pihole_misc_extralogging = lookup('pihole_misc_extralogging', Boolean, 'first')
  $pihole_misc_readonly = lookup('pihole_misc_readonly', Boolean, 'first')
  $pihole_misc_check_load = lookup('pihole_misc_check_load', Boolean, 'first')
  $pihole_misc_check_shmem = lookup('pihole_misc_check_shmem', String, 'first')
  $pihole_misc_check_disk = lookup('pihole_misc_check_disk', String, 'first')

  # Debug
  $pihole_debug_database = lookup('pihole_debug_database', Boolean, 'first')
  $pihole_debug_networking = lookup('pihole_debug_networking', Boolean, 'first')
  $pihole_debug_locks = lookup('pihole_debug_locks', Boolean, 'first')
  $pihole_debug_queries = lookup('pihole_debug_queries', Boolean, 'first')
  $pihole_debug_flags = lookup('pihole_debug_flags', Boolean, 'first')
  $pihole_debug_shmem = lookup('pihole_debug_shmem', Boolean, 'first')
  $pihole_debug_gc = lookup('pihole_debug_gc', Boolean, 'first')
  $pihole_debug_arp = lookup('pihole_debug_arp', Boolean, 'first')
  $pihole_debug_regex = lookup('pihole_debug_regex', Boolean, 'first')
  $pihole_debug_api = lookup('pihole_debug_api', Boolean, 'first')
  $pihole_debug_tls = lookup('pihole_debug_tls', Boolean, 'first')
  $pihole_debug_overtime = lookup('pihole_debug_overtime', Boolean, 'first')
  $pihole_debug_status = lookup('pihole_debug_status', Boolean, 'first')
  $pihole_debug_caps = lookup('pihole_debug_caps', Boolean, 'first')
  $pihole_debug_dnssec = lookup('pihole_debug_dnssec', Boolean, 'first')
  $pihole_debug_vectors = lookup('pihole_debug_vectors', Boolean, 'first')
  $pihole_debug_resolver = lookup('pihole_debug_resolver', Boolean, 'first')
  $pihole_debug_edns0 = lookup('pihole_debug_edns0', Boolean, 'first')
  $pihole_debug_clients = lookup('pihole_debug_clients', Boolean, 'first')
  $pihole_debug_aliasclients = lookup('pihole_debug_aliasclients', Boolean, 'first')
  $pihole_debug_events = lookup('pihole_debug_events', Boolean, 'first')
  $pihole_debug_helper = lookup('pihole_debug_helper', Boolean, 'first')
  $pihole_debug_config = lookup('pihole_debug_config', Boolean, 'first')
  $pihole_debug_inotify = lookup('pihole_debug_inotify', Boolean, 'first')
  $pihole_debug_webserver = lookup('pihole_debug_webserver', Boolean, 'first')
  $pihole_debug_extra = lookup('pihole_debug_extra', Boolean, 'first')
  $pihole_debug_reserved = lookup('pihole_debug_reserved', Boolean, 'first')
  $pihole_debug_ntp = lookup('pihole_debug_ntp', Boolean, 'first')
  $pihole_debug_netlink = lookup('pihole_debug_netlink', Boolean, 'first')
  $pihole_debug_all = lookup('pihole_debug_all', Boolean, 'first')

	# Manage PiHole TOML config
	file { '/etc/pihole/pihole.toml':
		ensure  => file,
		owner   => 'pihole',
		group   => 'pihole',
		mode    => '0640',
		content => template('pihole/pihole.toml.erb'),
		require => [User['pihole'], Exec['pihole-install-script']],
	}

	# Manage DNS entries if enabled
	# if $local_dns_entry {
	# 	$dns_file.each |$dnsfile| {
	# 		file { "/etc/dnsmasq.d/${dnsfile['dest']}":
	# 			ensure  => file,
	# 			owner   => 'root',
	# 			group   => 'root',
	# 			mode    => '0644',
	# 			content => template($dnsfile['template']),
	# 			# notify  => Service['pihole-FTL'],
	# 		}
	# 	}
	# }

	# # Blocklists
	$pihole_blocklist.each |$blocklist| {
		exec { "add-blocklist-${blocklist['url']}":
			command => "pihole-FTL sqlite3 /etc/pihole/gravity.db \"INSERT INTO adlist (address, enabled, comment, type) VALUES ('${blocklist['url']}', ${blocklist['enable']}, '${blocklist['comment']}', 0) ON CONFLICT(address, type) DO UPDATE SET enabled = excluded.enabled, comment = excluded.comment WHERE enabled IS NOT excluded.enabled OR comment IS NOT excluded.comment; SELECT changes();\"",
			path    => ['/usr/bin', '/bin'],
			onlyif  => "test $(pihole-FTL sqlite3 /etc/pihole/gravity.db \"SELECT COUNT(*) FROM adlist WHERE address='${blocklist['url']}' AND enabled=${blocklist['enable']} AND comment='${blocklist['comment']}'\") -eq 0",
			notify  => Exec['update-gravity'],
      require => File['/etc/pihole/pihole.toml'],
		}
	}

	# # Domainlists
	$pihole_domainlist.each |$domainlist| {
		exec { "add-domainlist-${domainlist['domain']}":
			command => "pihole-FTL sqlite3 /etc/pihole/gravity.db \"INSERT INTO domainlist (type, domain, enabled, comment) VALUES (${domainlist['type']}, '${domainlist['domain']}', ${domainlist['enabled']}, '${domainlist['comment']}') ON CONFLICT(domain, type) DO UPDATE SET enabled = excluded.enabled, comment = excluded.comment WHERE enabled IS NOT excluded.enabled OR comment IS NOT excluded.comment; SELECT changes();\"",
			path    => ['/usr/bin', '/bin'],
			onlyif  => "test $(pihole-FTL sqlite3 /etc/pihole/gravity.db \"SELECT COUNT(*) FROM domainlist WHERE domain='${domainlist['domain']}' AND enabled=${domainlist['enabled']} AND comment='${domainlist['comment']}'\") -eq 0",
			notify  => Exec['update-gravity'],
      require => File['/etc/pihole/pihole.toml'],
		}
	}

	# # Gravity update
	exec { 'update-gravity':
		command => '/usr/local/bin/pihole updateGravity',
		refreshonly => true,
		path => ['/usr/bin', '/bin'],
    require => [File['/etc/pihole/pihole.toml']],
	}

	# # Enable blocking if needed
	if $pihole_dns_blocking_active and !('blocking is enabled' in $facts['pihole_status']) {
		exec { 'enable-blocking':
			command => '/usr/local/bin/pihole enable',
			path    => ['/usr/bin', '/bin'],
			require => Exec['update-gravity'],
		}
	}
}
