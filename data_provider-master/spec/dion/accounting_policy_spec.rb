require 'spec_helper'

describe Dion::AccountingPolicy do

  it "should create/update Accounting Policy record" do
    Dion::AccountingPolicy.find_and_update_attributes( :company_code => '17020498', :year_ending => '31/03/2011', :notes => "Notes 1" )
    (accounting_policy = DataProvider::AccountingPolicy.where( company_code: "17020498", year_ending: "31/03/2011" ).first).should_not be_nil
    accounting_policy.notes.should eq "Notes 1"
  end
end
