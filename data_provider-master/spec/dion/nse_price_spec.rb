require 'spec_helper'

describe Dion::NSEPrice do

  it "should create/update nse_price" do
    Dion::NSEPrice.find_and_update_attributes( :security_code => '017023928.00026005001', :price_date => '10/02/2012',
                                               :close_price => '9304.31' )
    (nse_price = DataProvider::NsePrice.where( :security_code => '017023928.00026005001').first).should_not be_nil
    nse_price.price_date.should eq Date.parse('10/02/2012')
    nse_price.close_price.should eq 9304.31
  end

 end
