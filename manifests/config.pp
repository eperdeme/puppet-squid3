define squid3::config ($order = '', $content = '', $target = '') {
  include concat::setup

  if !defined(Concat["${target}"]) {
    concat { "${target}": }
  }

  concat::fragment { "${name}":
    target  => $target,
    content => $content,
    order   => $order,
    notify  => Service[$squid3::service_name],
    require => Package[$squid3::package_name]
  }
}
