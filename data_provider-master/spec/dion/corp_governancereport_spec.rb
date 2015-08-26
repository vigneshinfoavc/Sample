require 'spec_helper'

describe Dion::CorpGovernancereport do

  it "should create/update CorpGovernancereport record" do
    Dion::CorpGovernancereport.find_and_update_attributes( :company_code => '17020498', :year_ending => '31/03/2011', :notes => "Notes 1" )
    (corp_governancereport = DataProvider::CorpGovernancereport.where( company_code: "17020498", year_ending: "31/03/2011" ).first).should_not be_nil
    corp_governancereport.notes.should eq "Notes 1"
  end
end
