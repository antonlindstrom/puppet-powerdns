require 'spec_helper'

describe 'powerdns::service', :type => :class do

  it { should contain_service('pdns').with_ensure('running') }

end
