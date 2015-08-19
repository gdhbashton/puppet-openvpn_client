# == Class openvpn_client::service
#
# This class is meant to be called from openvpn_client.
# It ensure the service is running.
#
class openvpn_client::service {

  service { $::openvpn_client::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
