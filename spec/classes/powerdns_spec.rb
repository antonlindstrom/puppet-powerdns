require 'spec_helper'

describe 'powerdns', :type => :class do

  it { should contain_package('powerdns').with_ensure('present') }
  it { should contain_service('powerdns').with_ensure('running') }

end
