define powerdns::config($value, $ensure='present') {

  file { "/etc/powerdns/pdns.d/${name}.conf":
    ensure  => $ensure,
    owner   => root,
    group   => root,
    mode    => '0700',
    content => "${name}=${value}",
    require => Class['powerdns::package'],
    notify  => Class['powerdns::service'],
  }

}
