require 'rake'

require 'puppet-lint/tasks/puppet-lint'
require 'rspec/core/rake_task'

PuppetLint.configuration.send("disable_80chars")

task :default => [:lint, :dependencies, :spec]

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern     = 'spec/*/*_spec.rb'
  t.rspec_opts  = '--color'
end

desc 'Install dependencies with librarion-puppet'
task :dependencies do
  sh 'librarian-puppet install --path spec/fixtures/modules'
end
