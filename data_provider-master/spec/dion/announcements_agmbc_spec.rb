require 'spec_helper'

describe Dion::AnnouncementsAGMBC do

  it "should create/update announcements_agmbc record" do
    Dion::AnnouncementsAGMBC.find_and_update_attributes( :company_code => '17020498', :date_of_announcement => '31/03/2011', :source_code => 763 )
    (announcements_agmbc = DataProvider::AnnouncementsAgmbc.where( company_code: "17020498", date_of_announcement: Date.parse("31/03/2011") ).first).should_not be_nil
    announcements_agmbc.source_code.should eq 763
  end
end
