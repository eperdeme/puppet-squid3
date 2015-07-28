# Define: squid3::http_access
#
# Adds or configures a squid http_access rules
#
# Usage:
#  squid3::config { 'listen on 3128':
#    order      => '10',
#    cfg_data   => 'http_port 3128'
#  }
#

define squid3::config (
  $absent   = false,
  $target   = "${squid3::include_dir}/squid.conf",
  $cfg_data = '',
  $order    = '10',
  $enable   = true) {
  squid3::ccat { "${name}":
    content => "$cfg_data\n",
    order   => "$order",
    target  => "$target"
  }
}
