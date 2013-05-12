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

define squid3::http_access (
  $absent     = false,
  $acl_access = '',
  $target     = "${squid3::include_dir}/${order}_${acl_access}_${name}",
  $template   = 'squid3/http_access.erb',
  $acl_data   = '',
  $order      = '10',) {
  include concat::setup

  if $absent == false {
    concat::fragment { "${acl_access}_${name}":
      target  => $target,
      content => template($template),
      order   => $order,
    }
  }
}
