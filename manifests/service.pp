class powerdns::service(
  $ensure = 'present'
) {

  $ensure_service = $ensure ? {
    'present' => 'running',
    default   => 'stopped'
  }

  service { 'pdns':
    ensure      => $ensure_service,
    enable      => true,
    hasrestart  => true,
    hasstatus   => true,
    require     => Class['powerdns::package']
  }

}
