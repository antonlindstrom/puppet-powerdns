source 'https://rubygems.org'

puppetversion = ENV.key?('PUPPET_VERSION') ? "= #{ENV['PUPPET_VERSION']}" : ['>= 2.7']

gem 'puppet', puppetversion

group :test do
  gem 'rake'
  gem 'puppet-lint'
  gem 'rspec-puppet', '= 0.1.4'
  gem 'librarian-puppet', '>= 0.9.7'
end
