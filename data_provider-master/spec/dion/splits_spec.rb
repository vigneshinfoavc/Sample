require 'spec_helper'

describe Dion::Splits do

  it "should create/update a split record" do
    Dion::Splits.find_and_update_attributes( companycode: "14010105", date_of_announcement: '31/03/2010', :old_face_value => '10' )
    (split = DataProvider::Split.where(:company_code => '14010105', :date_of_announcement => Date.parse('31/03/2010')).first).should_not be_nil
    split.old_face_value.should eq 10
  end
end
