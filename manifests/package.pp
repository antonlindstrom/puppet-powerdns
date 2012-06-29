class powerdns::package($ensure = 'present') {

  package { 'pdns-server':
    ensure => $ensure,
  }

}
