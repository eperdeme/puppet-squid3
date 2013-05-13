define squid3::config ($order = '', $content = '', $target = '') {
  include concat::setup

  if !defined(Concat["${target}"]) {
    concat { "${target}": }
  }

  concat::fragment { "${name}":
    target  => $target,
    content => $content,
    order   => $order,
  }
}
