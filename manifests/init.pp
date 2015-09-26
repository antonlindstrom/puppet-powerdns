# Public: Install the powerdns server
#
# ensure       - Ensure powerdns to be present or absent
# source       - Source package of powerdns server,
#                default is package provider
# purge_config - Delete configuration files which are not managed with powerdns::config
#
# Example:
#
#    # Include with default
#    include powerdns
#
class powerdns(
  $ensure       = 'present',
  $source       = '',
  $purge_config = false,
) {

  anchor { 'powerdns::begin': ;
    'powerdns::end': ;
  }

  class { 'powerdns::package':
    ensure       => $ensure,
    source       => $source,
    purge_config => $purge_config,
  }

  class { 'powerdns::service':
    ensure => $ensure,
  }

  Anchor['powerdns::begin'] -> Class['powerdns::service'] -> Anchor['powerdns::end']
  Anchor['powerdns::begin'] -> Class['powerdns::package'] -> Anchor['powerdns::end']
}
