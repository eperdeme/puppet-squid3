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
  $address,
  $comment  = $name,
  $absent   = false,
  $target   = '${squid3::include_dir}/${acl_type}_${name}',
  $template = 'squid3/http_access.erb',
  $order    = '10',) {

  if $absent == false {
    concat::fragment { "csf-allow-${address}-${comment}":
      target  => $target,
      content => "${address} # ${comment}\n",
      order   => $order,
    }
  }
}