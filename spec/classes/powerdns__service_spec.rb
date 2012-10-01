require 'spec_helper'

describe 'powerdns::service', :type => :class do

  describe 'should be present' do
    let(:params) { { :ensure => 'present'  } }

    it { should contain_service('pdns').with_ensure('running') }
  end

  describe 'should be absent' do
    let(:params) { { :ensure => 'absent'  } }

    it { should contain_service('pdns').with_ensure('stopped') }
  end
end
