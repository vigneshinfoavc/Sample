require 'spec_helper'

describe Dion::BSEPrice do

  it "should create/update bse_price" do
    Dion::BSEPrice.find_and_update_attributes( :security_code => '017023928.00026005001', :price_date => '10/02/2012',
                                               :close_price => '9304.31' )
    (bse_price = DataProvider::BsePrice.where( :security_code => '017023928.00026005001').first).should_not be_nil
    bse_price.price_date.should eq Date.parse('10/02/2012')
    bse_price.close_price.should eq 9304.31
  end

 end
