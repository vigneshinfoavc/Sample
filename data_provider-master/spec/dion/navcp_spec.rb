require 'spec_helper'

describe Dion::NAVCP do

  it "should create/update Scheme" do
    create :'data_provider/scheme', :security_code => '14051233.002199'
    Dion::NAVCP.find_and_update_attributes( :security_code => '14051233.002199', :ticker => 'TICK', :prev1_week_per => "44.2352", :nav_amount=> "13.6985")
    (scheme = DataProvider::Scheme.where( :security_code => '14051233.002199').first).should_not be_nil
    scheme.ticker_name.should eq 'TICK'
    scheme.prev1_week_percent.should eq 44.2352
    scheme.nav_amount.should be_a_indian_currency_of 13.6985
  end

 end
