require 'spec_helper'

describe 'powerdns', :type => :class do

  it { should include_class('powerdns::package') }
  it { should include_class('powerdns::service') }

end
