class powerdns($ensure = 'present') {

  $ensure_service = $ensure ? {
    'present' => 'running',
    'absent'  => 'stopped',
  }

  package { 'powerdns':
    ensure => $ensure,
    name   => 'pdns-server',
  }

  service { 'powerdns':
    ensure      => $ensure_service,
    name        => 'pdns',
    enable      => true,
    hasrestart  => true,
    hasstatus   => true,
  }

#  file { '/etc/powerdns/pdns.conf':
#    ensure => $ensure,
#    owner   => root,
#    group   => root,
#    mode    => '0644',
#    content => template('powerdns/pdns.conf.erb'),
#    notify  => Service['powerdns'],
#  }

}
