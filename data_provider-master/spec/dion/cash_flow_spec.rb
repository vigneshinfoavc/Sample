require 'spec_helper'

describe Dion::CashFlow do

  it "should create/update cash_flow" do
    Dion::CashFlow.find_and_update_attributes( company_code: "16610155", year_ending: "31/03/2011", type: "A", months: 12, pbt: "-247796", :dvdnd_net => '23343555666' )
    (cash_flow = DataProvider::CashFlow.where( :company_code => '16610155').first).should_not be_nil
    cash_flow.profits_before_tax.should eq -247796
		cash_flow.dividend_net.should eq 23343555666
  end

 end
