require 'spec_helper'

describe 'powerdns', :type => :class do

  it { should include_class('powerdns::package') }
  it { should include_class('powerdns::service') }

  context 'with purge_config=true' do
    let(:params) { { purge_config: true } }

    it 'should pass purge_config to powerdns::package' do
      should contain_class('powerdns::package').with_purge_config(true)
    end
  end

end
