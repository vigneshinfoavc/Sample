require 'spec_helper'

describe Dion::MFObjectives do
  it "should create/update Scheme" do
    create :'data_provider/scheme', :security_code => '14051233.002199'
    Dion::MFObjectives.find_and_update_attributes( :securitycode => '14051233.002199', :objective => 'Objective', :delete_flag => "False")
    (scheme = DataProvider::Scheme.where( :security_code => '14051233.002199').first).should_not be_nil
    scheme.objective.should eq 'Objective'
  end

end
