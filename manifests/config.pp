define squid3::config ($order = '', $content = '', $target = '') {
  include concat::setup

  if !defined(Concat["${$target}"]) {
    concat { "${$target}":

    }
  }

  concat::fragment { "${content}${target}":
    target  => $target,
    content => $content,
    order   => $order,
  }
}
