require 'spec_helper'

describe 'powerdns', :type => :class do

  it { should contain_package('pdns-server').with_ensure('present') }
  it { should contain_service('pdns').with_ensure('running') }

end
