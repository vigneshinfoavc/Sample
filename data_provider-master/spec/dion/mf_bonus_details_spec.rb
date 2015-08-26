require 'spec_helper'

describe Dion::MFBonusDetails do
  it "should create/update MFBonusDetails" do
    Dion::MFBonusDetails.find_and_update_attributes( securitycode: "14051233.002199",
                                                     bonus_date: "28/09/2007",
                                                     ratio_offered: "1.4",
                                                     ratio_existing: "1000" )
    (bonus_detail = DataProvider::MfBonusDetail.where( security_code: "14051233.002199",
                                         bonus_date: "28/09/2007").first).should_not be_nil
    bonus_detail.should_not respond_to(:securitycode)
    bonus_detail.ratio_offered.should eq 1.4
    bonus_detail.ratio_existing.should eq 1000
  end
end
