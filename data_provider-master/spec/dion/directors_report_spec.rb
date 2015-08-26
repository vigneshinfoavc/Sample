require 'spec_helper'

describe Dion::DirectorsReport do

  it "should create/update DirectorsReport record" do
    Dion::DirectorsReport.find_and_update_attributes( :company_code => '17020498', :year_ending => '31/03/2011', :notes => "Notes 1" )
    (directors_report = DataProvider::DirectorsReport.where( company_code: "17020498", year_ending: "31/03/2011" ).first).should_not be_nil
    directors_report.notes.should eq "Notes 1"
  end
end
