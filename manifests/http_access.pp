# Define: squid3::http_access
#
# Adds or configures a squid http_access rules
#
# Usage:
#  squid3::http_access { 'allow_zen_hosts':
#    order      => '10',
#    acl_access => 'allow',
#    acl_data   => 'zen_hosts'
#  }
#

define squid3::http_access (
  $absent     = false,
  $target     = "${squid3::include_dir}/http_access.conf",
  $acl_access = '',
  $acl_data   = '',
  $order      = '10',
  $enable     = true) {
  squid3::concat { "${acl_access}_${name}":
    content => "http_access ${acl_access} ${acl_data}\n",
    order   => "$order",
    target  => "$target"
  }
}
