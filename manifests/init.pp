class powerdns(
  $ensure = 'present',
  $source = ''
) {

  class { 'powerdns::package':
    ensure => $ensure,
    source => $source
  }

  class { 'powerdns::service':
    ensure => $ensure,
  }

}
