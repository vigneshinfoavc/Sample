require 'spec_helper'

describe Dion::NotesToAccount do

  it "should create/update NotesToAccount record" do
    Dion::NotesToAccount.find_and_update_attributes( :company_code => '17020498', :year_ending => '31/03/2011', :notes => "Notes 1" )
    (notes_to_account = DataProvider::NotesToAccount.where( company_code: "17020498", year_ending: "31/03/2011" ).first).should_not be_nil
    notes_to_account.notes.should eq "Notes 1"
  end
end
