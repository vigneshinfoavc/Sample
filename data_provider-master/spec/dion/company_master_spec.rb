require 'spec_helper'

describe Dion::CompanyMaster do

  it "should create/update company" do
    Dion::CompanyMaster.find_and_update_attributes( :company_code => '13520030', :company_name => 'Ravileela Granites Ltd.',
                                                    :product_status_code => "1753", :industry_name => 'Granites/Marbles',
                                                    :short_company_name => 'Ravileela Granites')
    (company = DataProvider::Company.where( :code => '13520030').first).should_not be_nil
    Dion::CompanyMaster.find_and_update_attributes( :company_code => '13520020', :company_name => 'Rela Granites Ltd.')
    company.should_not respond_to(:company_code)
    company.name.should eq 'Ravileela Granites Ltd.'
    company.short_name.should eq 'Ravileela Granites'
    company.product_status_code.should eq '1753'
    company.industry_name.should eq 'Granites/Marbles'
  end

  it "should create/update all the records" do
    Dion::CompanyMaster.find_and_update_attributes( :company_code => '13520020', :company_name => 'Rela Granites Ltd.')
    Dion::CompanyMaster.find_and_update_attributes( :company_code => '13530020', :company_name => 'Rila Granites Ltd.')
    DataProvider::Company.count.should eq 2
  end

 end
