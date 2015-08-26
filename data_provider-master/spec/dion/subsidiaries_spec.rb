require 'spec_helper'

describe Dion::Subsidiaries do

  it "should create/update a subsidiary record" do
    Dion::Subsidiaries.find_and_update_attributes( company_code: "13191258", company_name: 'Kautilya Infotech Ltd.', :parent_company_code => '16030148' )
    (subsidiary = DataProvider::Subsidiary.where(:company_code => '13191258' ).first).should_not be_nil
    subsidiary.company_name.should eq 'Kautilya Infotech Ltd.'
    subsidiary.parent_company_code.should eq '16030148'

  end
end
