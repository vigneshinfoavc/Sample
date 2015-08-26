require 'spec_helper'

describe Dion::BankingRatios do

  it "should create/update banking ratio record" do
    Dion::BankingRatios.find_and_update_attributes( :company_code => '17020498', :year_ending => '31/03/2011',
                                                     :admin_expenses => "94799000",
                                                     :months => "12",
                                                     :net_profit_per_branch => "234.8769" )
    (banking_ratio = DataProvider::BankingRatio.where( company_code: "17020498", year_ending: Date.parse("31/03/2011"), months: 12 ).first).should_not be_nil
    banking_ratio.net_profit_per_branch.should eq 234.8769
  end
end
