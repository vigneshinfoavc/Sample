require 'spec_helper'

describe Dion::Products do

  it "should create/update a products record" do
    Dion::Products.find_and_update_attributes( company_code: "11020009", year_ending: "31/03/2010", no_of_months: '12',
                                           :element => [ "ProductCode" => "100190.0205", "ProductName" => 'Wheat Items' ] )
    (product = DataProvider::Product.where(:company_code => '11020009', :year_ending => Date.parse('31/03/2010'), :no_of_months => 12).first).should_not be_nil
    product.element.first["ProductCode"].should eq '100190.0205'
    product.element.first["ProductName"].should eq 'Wheat Items'
  end
end
