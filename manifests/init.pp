class powerdns($ensure = 'present') {

  class { 'powerdns::package':
    ensure => $ensure,
  }

  class { 'powerdns::service':
    ensure => $ensure,
  }

}
