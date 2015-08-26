require 'spec_helper'

describe Dion::MFBonusDetails do
  it "should create/update MFBonusDetails" do
    Dion::MFDividendDetails.find_and_update_attributes( securitycode: "14050439.002067",
                                                        dividend_date: "15/02/2012",
                                                        dividend_type: "2073",
                                                        percentage: "30" )
    (dividend_detail = DataProvider::MfDividendDetail.where( security_code: "14050439.002067").first).should_not be_nil
    dividend_detail.should_not respond_to(:securitycode)
    dividend_detail.dividend_type.should eq 2073
    dividend_detail.percentage.should eq 30
  end
end
