require 'spec_helper'

describe Dion::AuditedResults do

  it "should create/update AuditedResult record" do
    Dion::AuditedResults.find_and_update_attributes( :companycode => '17020498', :year_ending => '31/03/2011',
                                                     :manufacturingexpenses => "94799000",
                                                     :numberof_equity_shares => "2299070000",
                                                     :dep_of_ind_branches => "86741000",
                                                     :resand_surplus => "121324445")
    (audited_result = DataProvider::AuditedResult.where( company_code: "17020498", year_ending: Date.parse('31/03/2011') ).first).should_not be_nil
    audited_result.manufacturing_expenses.should eq 94799000
    audited_result.number_of_equity_shares.should eq 2299070000
    audited_result.deposits_of_indian_branches.should eq 86741000
    audited_result.reserves_and_surplus.should eq 121324445
  end
end
