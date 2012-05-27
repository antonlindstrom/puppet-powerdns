class powerdns($ensure = 'present') {

  $ensure_service = $ensure ? {
    'present' => 'running',
    'absent'  => 'stopped',
  }

  package { 'pdns-server':
    ensure => $ensure,
  }

  service { 'pdns':
    ensure      => $ensure_service,
    enable      => true,
    hasrestart  => true,
    hasstatus   => true,
    require     => Package['pdns-server'],
  }

#  file { '/etc/powerdns/pdns.conf':
#    ensure => $ensure,
#    owner   => root,
#    group   => root,
#    mode    => '0644',
#    content => template('powerdns/pdns.conf.erb'),
#    notify  => Service['pdns'],
#  }

}
