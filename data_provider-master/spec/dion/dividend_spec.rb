require 'spec_helper'

describe Dion::Dividend do

  it "should create/update Dividend record" do
    Dion::Dividend.find_and_update_attributes( :company_code => '17020498', :date_of_announcement => '31/03/2011', :percentage => '763' )
    (dividend = DataProvider::Dividend.where( company_code: "17020498", date_of_announcement: Date.parse("31/03/2011") ).first).should_not be_nil
    dividend.percentage.should eq 763
  end
end
