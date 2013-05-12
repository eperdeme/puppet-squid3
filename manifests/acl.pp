# Define: squid3::acl
#
# Adds or configures a squid ACL
#
# Usage:
#  squid3::acl { 'safe_ports':
#    acl_type => 'port',
#    acl_data => '80 443 8080 9418'
#  }
#

define squid3::acl ($template = 'squid3/acl.erb', $acl_type = '', $acl_data = '', $enable = true) {
  $ensure = bool2ensure($enable)

  file { "squid_acl_${acl_type}_${name}":
    path    => "${squid3::include_dir}/${acl_type}_${name}",
    owner   => root,
    group   => root,
    mode    => '0755',
    ensure  => $ensure,
    require => Package['squid3'],
    notify  => Service['squid3'],
    content => template("${template}"),
  }
}
