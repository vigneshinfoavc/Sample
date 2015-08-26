require 'spec_helper'

describe Dion::IndividualHolding do

  it "should create/update IndividualHolding record" do
    Dion::IndividualHolding.find_and_update_attributes( :company_code => '17020498', :share_holding_date => '31/03/2011')
    (individual_holding = DataProvider::IndividualHolding.where( company_code: "17020498", share_holding_date: Date.parse("31/03/2011") ).first).should_not be_nil
  end
end
