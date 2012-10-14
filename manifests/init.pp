# Public: Install the powerdns server
#
# ensure - Ensure powerdns to be present or absent
# source - Source package of powerdns server,
#          default is package provider
#
# Example:
#
#    # Include with default
#    include powerdns
#
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
