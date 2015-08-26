require 'spec_helper'

describe Dion::CurrDetails do

  it "should create/update company" do
    create :'data_provider/company', :code => '13520030'
    Dion::CurrDetails.find_and_update_attributes( :company_code => '13520030', :pe_ratio => '34.44', :eps => "6.22", :div_yield => "0.91")
    (company = DataProvider::Company.where( :code => '13520030').first).should_not be_nil
    company.pe.should eq 34.44
    company.dividend_yield.should eq 0.91
    company.eps.should eq 6.22
  end

 end
