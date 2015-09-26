require 'spec_helper'

describe 'powerdns::mysql', :type => :class do

  it do
    should contain_package('pdns-backend-mysql').with_ensure('present')
  end

  it do
    should contain_file('/etc/powerdns/pdns.d/pdns.local.gmysql.conf').with_ensure('present')
  end

end
