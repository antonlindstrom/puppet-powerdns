source :rubygems

puppetversion = ENV.key?('PUPPET_VERSION') ? "= #{ENV['PUPPET_VERSION']}" : ['>= 2.7']

gem 'puppet', puppetversion

group :test do
  gem 'rake'
  gem 'puppet-lint'
  gem 'rspec-puppet', '>= 0.1.3'
  gem 'librarian-puppet'
end
