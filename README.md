# PowerDNS module

[![Build Status](https://secure.travis-ci.org/antonlindstrom/puppet-powerdns.png?branch=master)](http://travis-ci.org/antonlindstrom/puppet-powerdns)

This is a module to manage PowerDNS with Puppet. The configuration is split into several files and put in `/etc/powerdns/pdns.d`. This makes it easy to read which configurations are currently modified.

## Usage

#### powerdns

    include powerdns

#### powerdns::config

Set configuration settings in a pdns.d directory (this assumes that you have `include=/etc/powerdns/pdns.d` in pdns.conf).

    powerdns::config { 'cache-ttl':
      ensure => present,
      value  => 20,
    }

Or, set IPv6 address:

    powerdns::config { 'local-ipv6':
      ensure => present,
      value  => $::ipaddress6,
    }

#### powerdns::postgresql

This will install the postgresql backend for powerdns:

    class { 'powerdns::postgresql':
      ensure   => present,
      user     => 'powerdns',
      password => 'secret',
      host     => 'localhost',
      port     => '5432',
      dbname   => 'pdns',
      dnssec   => 'no',
    }

The `dnssec` value can be either 'yes' or 'no'. Default is 'yes'..

To be able to use it without importing data and without hassle, make sure that Postgres is installed before the `powerdns::postgresql` class.

## Testing

    gem install bundler
    bundle install
    bundle exec rake

## Contribute
Send pull request and add tests. Make sure all tests pass (modify if you need) and make sure it's style-guide compliant.
