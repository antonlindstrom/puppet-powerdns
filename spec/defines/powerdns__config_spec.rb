require 'spec_helper'

describe 'powerdns::config', :type => :define do
  let(:title) { 'cache-ttl' }
  let(:params) { { :value => '20' } }

  it do should contain_file('/etc/powerdns/pdns.d/cache-ttl.conf').with(
    'ensure'  => 'present',
    'owner'   => 'root',
    'group'   => 'root',
    'mode'    => '0700',
    'content' => "cache-ttl=20",
  ) end

end
