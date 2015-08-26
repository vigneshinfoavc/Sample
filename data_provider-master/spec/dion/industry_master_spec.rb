require 'spec_helper'

describe Dion::IndustryMaster do

  it "should create/update industry" do
    Dion::IndustryMaster.find_and_update_attributes( :industry_code => '103', :industry_name => 'Commodities - Trading - Tea',
                                                    :major_sector_code => '390' )
    (industry = DataProvider::Industry.where( :code => 103 ).first).should_not be_nil
    industry.should_not respond_to(:industry_code)
    industry.major_sector_code.should eq 390
    industry.name.should eq 'Commodities - Trading - Tea'
  end

 end
