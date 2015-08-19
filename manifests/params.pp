# == Class openvpn_client::params
#
# This class is meant to be called from openvpn_client.
# It sets variables according to platform.
#
class openvpn_client::params {
  case $::osfamily {
    'Debian': {
      $openvpn_dir  = '/etc/openvpn'
      $package_name = 'openvpn'
      $service_name = 'openvpn'
    }
    'RedHat', 'Amazon': {
      $openvpn_dir  = '/etc/openvpn'
      $package_name = 'openvpn'
      $service_name = 'openvpn'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
