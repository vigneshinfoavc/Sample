require 'spec_helper'

describe Dion::ListingMaster do

  it "should create/update company" do
    Dion::ListingMaster.find_and_update_attributes( security_code: "014070078.00005001001",
                                                    scrip_code1_given_by_exchange: "532117",
                                                    fifty_two_week_high: '0.43' )
    (listing = DataProvider::Listing.where( :security_code => "014070078.00005001001").first).should_not be_nil
    listing.scrip_code1_given_by_exchange.should eq '532117'
    listing.fifty_two_week_high.should eq 0.43
  end

 end
