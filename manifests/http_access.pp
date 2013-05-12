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
  $target     = '${squid3::include_dir}/${acl_type}_${name}',
  $template   = 'squid3/http_access.erb',
  $acl_data   = '',
  $acl_access = '',
  $order      = '10',) {
  include concat::setup

  if $absent == false {
    concat::fragment { "${order}_${acl_access}_${name}":
      target  => $target,
      content => template($template),
      order   => $order,
    }
  }
}
