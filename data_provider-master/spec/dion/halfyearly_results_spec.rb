require 'spec_helper'

describe Dion::HalfyearlyResults do

  it "should create/update HalfyearlyResult record" do
    Dion::HalfyearlyResults.find_and_update_attributes( :company_code => '17020498', :year_ending => '31/03/2011',
                                                        :months => '6', :half => '1',
                                                        :employee_expenses => "94799000",
                                                        :gross_profit => "2299070000" )
    (halfyearly_result = DataProvider::HalfyearlyResult.where( company_code: "17020498", year_ending: "31/03/2011" ).first).should_not be_nil
    halfyearly_result.employee_expenses.should eq 94799000
    halfyearly_result.gross_profit.should eq 2299070000
  end
end
