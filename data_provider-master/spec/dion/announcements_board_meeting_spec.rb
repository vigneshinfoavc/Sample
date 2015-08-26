require 'spec_helper'

describe Dion::AnnouncementsBoardMeeting do

  it "should create/update AnnouncementsBoardMeeting record" do
    Dion::AnnouncementsBoardMeeting.find_and_update_attributes( :company_code => '17020498', :brd_date => '31/03/2011', :src_code => 763 )
    (announcements_board_meeting = DataProvider::AnnouncementsBoardMeeting.where( company_code: "17020498", brd_date: Date.parse("31/03/2011") ).first).should_not be_nil
    announcements_board_meeting.src_code.should eq 763
  end
end
