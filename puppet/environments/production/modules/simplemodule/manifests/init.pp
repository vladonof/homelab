class simplemodule {

  $package_name = lookup('simplemodule::package_name')

  package { $package_name:
    ensure => installed,
  }

}
