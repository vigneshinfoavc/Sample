require 'spec_helper'

describe Dion::Rawmaterial do

  it "should create/update a rawmaterial record" do
    Dion::Rawmaterial.find_and_update_attributes( company_code: "11020009", year_ending: "31/03/2010",
                                           :element => [ "ProductCode" => "100190.0205", "ProdMix" => '100' ] )
    (rawmaterial = DataProvider::Rawmaterial.where(:company_code => '11020009', :year_ending => Date.parse('31/03/2010')).first).should_not be_nil
    rawmaterial.element.first["ProductCode"].should eq '100190.0205'
    rawmaterial.element.first["ProdMix"].should eq '100'
  end
end
