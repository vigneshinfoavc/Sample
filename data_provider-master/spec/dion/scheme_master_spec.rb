require 'spec_helper'

describe Dion::SchemeMaster do

  it "should create/update scheme" do
    Dion::SchemeMaster.find_and_update_attributes( securitycode: "14051233.002199",
																									 scheme_type: '2063',
                                                   scheme_type_description: "Open Ended",
																									 scheme_name: 'Scheme Name',
                                                   initial_price_uom: '763',
                                                   fund_manager_name: "Aniket Inamdar",
                                                   minimum_invement_amount: "5000",
                                                   sip: "True" )
    Dion::SchemeMaster.find_and_update_attributes( securitycode: "121324.2324324", scheme_name: "Scheme 1123")
    (scheme = DataProvider::Scheme.where( :security_code => '14051233.002199').first).should_not be_nil
    scheme.should_not respond_to(:scheme_name)
		scheme.type.should eq 2063
    scheme.type_description.should eq 'Open Ended'
		scheme.name.should eq 'Scheme Name'
    scheme.initial_price_uom.should eq 763
    scheme.minimum_investment_amount.should eq 5000
  end

  it "should create/update all the given records" do
    Dion::SchemeMaster.find_and_update_attributes( securitycode: "121324.2324324",
                                                   scheme_name: "Scheme 1123",
                                                   delete_flag: "False")
    Dion::SchemeMaster.find_and_update_attributes( securitycode: "121324.23224",
                                                   scheme_name: "Scheme 1323",
                                                   delete_flag: "False")
    DataProvider::Scheme.count.should eq 2
  end

 end
