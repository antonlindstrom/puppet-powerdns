require 'spec_helper'

describe 'powerdns::postgresql', :type => :class do

  it { should contain_package('pdns-backend-pgsql').with_ensure('present') }

end
