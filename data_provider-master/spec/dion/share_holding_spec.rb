require 'spec_helper'

describe Dion::ShareHolding do

  it "should create/update a share_holding record" do
    Dion::ShareHolding.find_and_update_attributes( company_code: "11020009", share_holding_date: "31/03/2010",
                                           :element => [ "NoOfShareHolders" => "5406", "EquityShareHold" => '59665' ] )
    (share_holding = DataProvider::ShareHolding.where(:company_code => '11020009', :share_holding_date => Date.parse('31/03/2010')).first).should_not be_nil
    share_holding.element.first["NoOfShareHolders"].should eq '5406'
    share_holding.element.first["EquityShareHold"].should eq '59665'
  end
end
