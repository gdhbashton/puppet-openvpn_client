# Class: openvpn_client
# ===========================
#
# Install and manage the openvpn package and service.
#
# Parameters
# ----------
#
# * `openvpn_dir`
# The directory created by the package to store the openvpn configs. Should be
# an absolute path. Defaults differ according to OS. See `params.pp`.
#
# * `package_name`
# The name of the OpenVPN package. Should be a string. Defaults differ according
# to OS. See `params.pp`.
#
# * `service_name`
# The name of the OpenVPN service. Should be a string. Defaults differ according
# to OS. See `params.pp`.
#
class openvpn_client (
  $openvpn_dir  = $::openvpn_client::params::openvpn_dir,
  $package_name = $::openvpn_client::params::package_name,
  $service_name = $::openvpn_client::params::service_name,
  ) inherits ::openvpn_client::params {

  # validate parameters here
  validate_absolute_path($openvpn_dir)
  validate_string($package_name, $service_name)

  class { '::openvpn_client::install': } ->
  Openvpn_client::Client<||> ~>
  class { '::openvpn_client::service': } ->
  Class['::openvpn_client']
}
