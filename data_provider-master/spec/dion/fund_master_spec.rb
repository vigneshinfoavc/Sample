require 'spec_helper'

describe Dion::FundMaster do
	it "should create a new Asset management company record" do
		Dion::FundMaster.find_and_update_attributes(
	  		:company_code             => '1120',
	  		:company_name             => 'Test Company',
	  		:sponser_name             => 'The Idiot',
	  		:trustee_company_name     => 'The Unknown',
	  		:mf_set_up_date           => '31/01/2011',
	  		:amc_code                 => '13456',
	  		:amc_name                 => 'Escrow Company',
	  		:amc_inc_date             => '01/05/2007',
	  		:ceo_name                 => 'The hero',
	  		:cio_name                 => 'The looser',
	  		:fund_manager_name        => 'The Magician',
	  		:compliance_officer_name  => 'Thookala Inispectaru',
	  		:inv_service_officer_name => 'Sherlock Homes',
	  		:auditors_name            => 'Plus man',
	  		:custodian_name           => 'Godfather',
	  		:registrar_name           => 'Richard Castle',
	  		:type_of_mutual_fund      => 'Unicorn'
			)
		(asset_management_company = DataProvider::AssetManagementCompany.where(:company_code => '1120').first).should_not be_nil
		asset_management_company.company_name.should eq 'Test Company'
		asset_management_company.mf_set_up_date.should eq Date.civil(2011, 01, 31)
		asset_management_company.name.should eq 'Escrow Company'
    asset_management_company.incorporation_date.should eq Date.parse('01/05/2007')
	end
end
