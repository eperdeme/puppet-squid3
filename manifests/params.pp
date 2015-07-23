# Class: squid3::params
#
# This class defines default parameters used by the main module class squid3
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to squid3 class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class squid3::params {
  # ## Application related parameters


  case $::osfamily {
    'RedHat'           : {
      if versioncmp($::operatingsystemrelease, '6') < 0 {
        $package_name = 'squid3'
      } else {
        $package_name = 'squid'
      }
      $service_name = 'squid'
      $config_file = '/etc/squid/squid.conf'
      $include_dir = '/etc/squid/squid-conf.d'

      $log_directory = '/var/log/squid'
      $coredump_dir = '/var/spool/squid'
    }
    'Debian', 'Ubuntu' : {
      $package_name = 'squid3'
      $service_name = 'squid3'
      $config_file = '/etc/squid3/squid.conf'
      $include_dir = '/etc/squid3/squid-conf.d'

      $log_directory = '/var/log/squid3'
      $coredump_dir = '/var/spool/squid3'
    }
    default            : {
      $package_name = 'squid'
      $service_name = 'squid'
      $config_file = '/etc/squid/squid.conf'
      $log_directory = '/var/log/squid'
      $coredump_dir = '/var/spool/squid'
    }
  }

  $port = '3128'
  $protocol = 'tcp'
  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = 'squid3/squid3.erb'
  $options = ''
  $service_autorestart = true
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false

}
