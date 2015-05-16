# == Class: xserver
#
# Initializes module
#
# === Parameters
#
# [*package_ensure*]
#   Passed directly to the `ensure` attribute of the `package` type. Defaults to 'present'.
#
class xserver (
    $package_ensure = $xserver::params::package_ensure,
  ) inherits xserver::params {

  package{$xserver::params::xserver_package:
    ensure => $xserver::params::package_ensure,
  }
  
  concat{$xserver::params::xserver_xorg_conf_file:
    ensure  => 'present',
    warn    => true,
    require => Package[$xserver::params::xserver_package],
  }
}
