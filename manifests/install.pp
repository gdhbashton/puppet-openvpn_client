# == Class openvpn_client::install
#
# This class is called from openvpn_client for install.
#
class openvpn_client::install {

  package { $::openvpn_client::package_name: ensure => 'present' }
}
