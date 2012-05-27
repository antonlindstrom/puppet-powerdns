# PowerDNS module
Ad-hoc for simplicity and our use-cases.

## Usage

#### powerdns

    include powerdns

#### powerdns::postgresql

This will install the postgresql backend for powerdns:

    class { 'powerdns::postgresql':
      user  => 'powerdns'
    }

To be able to use it without importing data and without hassle, make sure that Postgres is installed before the `powerdns::postgresql` class.

## Testing

    gem install bundler
    bundle install
    bundle exec rake

## Contribute
Send pull request and add tests. Make sure all tests pass (modify if you need) and make sure it's style-guide compliant.
