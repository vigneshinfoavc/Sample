require 'spec_helper'

describe Dion::AuditorsReport do

  it "should create/update AuditorsReport record" do
    Dion::AuditorsReport.find_and_update_attributes( :company_code => '17020498', :year_ending => '31/03/2011', :notes => "Notes 1" )
    (auditors_report = DataProvider::AuditorsReport.where( company_code: "17020498", year_ending: "31/03/2011" ).first).should_not be_nil
    auditors_report.notes.should eq "Notes 1"
  end
end
