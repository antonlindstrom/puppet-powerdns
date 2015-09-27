require 'spec_helper'

describe 'powerdns::postgresql', :type => :class do

  it do
    should contain_package('pdns-backend-pgsql').with_ensure('present')
  end

  it do
    should contain_file('/etc/powerdns/pdns.d/pdns.local.gpgsql.conf').with_ensure('present')
  end

  describe 'should include correct schema when dnssec is yes' do
    let(:params) do
      { :dnssec => 'yes'  }
    end

    it do
      should contain_file('/opt/powerdns_schema.sql').with({
        'ensure' => 'present',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0644',
        'source' => 'puppet:///modules/powerdns/postgresql_schema.dnssec.sql'
      })
    end
  end

  describe 'should include correct schema when dnssec is no' do
    let(:params) do
      { :dnssec => 'no'  }
    end

    it do
      should contain_file('/opt/powerdns_schema.sql').with({
        'ensure' => 'present',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0644',
        'source' => 'puppet:///modules/powerdns/postgresql_schema.sql'
      })
    end
  end
end
