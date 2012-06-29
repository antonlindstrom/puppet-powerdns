require 'spec_helper'

describe 'powerdns::package', :type => :class do

  it { should contain_package('pdns-server').with_ensure('present') }

end
