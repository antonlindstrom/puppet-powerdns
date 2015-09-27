require 'spec_helper'

describe 'powerdns::config', :type => :define do
  let(:title) { 'cache-ttl' }
  let(:params) { { :value => '20' } }

  it do should contain_file('cache-ttl.conf').with(

    'ensure'  => 'present',
    'owner'   => 'root',
    'group'   => 'root',
    'mode'    => '0600',
    'content' => "cache-ttl=20\n"
  ) end

end
