require 'spec_helper'

describe Dion::Capitalstructure do

  it "should create/update company" do
    Dion::Capitalstructure.find_and_update_attributes( :company_code => '13520030', :modify_on =>'27 Feb 2009 16:14:59' )
    (capitalstructure = DataProvider::Capitalstructure.where( :company_code => '13520030').first).should_not be_nil
  end

 end
