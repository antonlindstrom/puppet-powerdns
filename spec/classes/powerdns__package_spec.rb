require 'spec_helper'

describe 'powerdns::package', :type => :class do

  it { should contain_package('pdns-server').with_ensure('present') }
  it { should contain_file('/etc/powerdns/pdns.d').with_ensure('directory').with_purge(false) }

  context 'with purge_config=true' do
    let(:params) { { purge_config: true } }

    it { should contain_file('/etc/powerdns/pdns.d').with_purge(true) }
  end
end
