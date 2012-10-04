class powerdns(
  $ensure = 'present',
  $source = ''
) {

  anchor { 'powerdns::begin': ;
    'powerdns::end': ;
  }

  class { 'powerdns::package':
    ensure => $ensure,
    source => $source
  }

  class { 'powerdns::service':
    ensure => $ensure,
  }

  Anchor['powerdns::begin'] -> Class['powerdns::service'] -> Anchor['powerdns::end']
  Anchor['powerdns::begin'] -> Class['powerdns::package'] -> Anchor['powerdns::end']
}
