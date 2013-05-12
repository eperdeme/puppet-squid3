# Define: squid3::acl
#
# Adds or configures a squid ACL
#
# Usage:
# Define the configuration file of an existing plugin:
# munin::plugin { 'squid':
#   source_config => 'example42/munin/squid-config',
#}
#
# Define the configuration file of an existing plugin in-line:
# munin::plugin { 'nginx':
#   content_config => "[nginx*]\nenv.url http://localhost/nginx_status";
#}
#
# Provide a custom plugin:
# munin::plugin { 'redis':
#   source => 'example42/munin/redis',
#}
#
# Provide a custom plugin with a custom configuration:
# munin::plugin { 'redis':
#   source        => 'example42/munin/redis',
#   source_config => 'example42/munin/redis-conf',
#}
#

define squid3::acl ($template = 'squid3/acl.erb', $acl_type = '', $acl_data = '', $enable = true) {
  $ensure = bool2ensure($enable)

  file { "squid_acl_${type}_${name}":
    path    => "${squid3::include_dir}/${name}",
    owner   => root,
    group   => root,
    mode    => '0755',
    ensure  => $ensure,
    require => Package['squid3'],
    notify  => Service['squid3'],
    content => template("${template}"),
  }
}
