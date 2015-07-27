# = Class: squid3
#
# This is the main squid3 class
#
#
# == Parameters
#
# Standard class parameters
# Define the general class behaviour and customizations
#
#
# See README for usage patterns.
#
class squid3 (
  String $include_dir          = $::squid3::params::include_dir,
  String $service_name         = $::squid3::params::service_name,
  String $config_file_template = $::squid3::params::template,) inherits squid3::params {
  # ## Managed resources
  package { $package_name: ensure => $version, }

  service { $service_name:
    ensure  => running,
    name    => $service_name,
    enable  => true,
    require => Package[$package_name],
  }

  file { $config_file:
    path    => $config_file,
    require => Package[$package_name],
    notify  => Service[$service_name],
    content => template($config_file_template),
  }

  file { $include_dir:
    ensure  => directory,
    path    => $include_dir,
    require => Package[$package_name],
    notify  => Service[$service_name],
    recurse => true,
  }

}
