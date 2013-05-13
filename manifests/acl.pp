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

define squid3::acl (
  $absent   = false,
  $target   = "${squid3::include_dir}/acl.conf",
  $acl_type = '',
  $acl_data = '',
  $order    = '10',
  $enable   = true) {
  squid3::config { "${acl_type}_${name}":
    content => "acl ${name} ${$acl_type} ${acl_data}",
    order   => "$order",
    target  => "$target"
  }
}
