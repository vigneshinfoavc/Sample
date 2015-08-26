require 'spec_helper'

describe Dion::KeyExecutives do

  it "should create/update Key Exectuctive record" do
    Dion::KeyExecutives.find_and_update_attributes( :company_code => '17020498', :modifyon => '10/02/2012 11:21')
    (key_exectutive = DataProvider::KeyExecutive.where( company_code: "17020498", modify_on: DateTime.parse('10/02/2012 11:21') ).first).should_not be_nil
  end
end
