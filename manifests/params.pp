# == Class: xserver::params
#
# Just some xserver::params.pp
#
class xserver::params {
  
  $package_ensure = 'present'
  
  case $::operatingsystem {
    'Ubuntu': {
      case $::operatingsystemmajrelease {
        '14.04': {
          $xserver_package = 'xserver-xorg'
          $xserver_xorg_conf_file = '/etc/X11/xorg.conf'
        }
        
        default: {
          fail("Unsupported platform: ${module_name} currently doesn't support ${::operatingsystem} ${::operatingsystemmajrelease}")
        }
      }
    }
    
    default: {
      fail("Unsupported platform: ${module_name} currently doesn't support ${::operatingsystem}")
    }
  }
}
