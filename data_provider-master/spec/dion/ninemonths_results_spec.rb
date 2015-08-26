require 'spec_helper'

describe Dion::NinemonthsResults do

  it "should create/update NinemonthsResult record" do
    Dion::NinemonthsResults.find_and_update_attributes( :company_code => '17020498', :year_ending => '31/03/2011',
                                                        :months => '3', :nine => '1',
                                                        :employee_expenses => "94799000",
                                                        :gross_profit => "2299070000" )
    (ninemonths_result = DataProvider::NinemonthsResult.where( company_code: "17020498", year_ending: "31/03/2011" ).first).should_not be_nil
    ninemonths_result.months.should eq 3
    ninemonths_result.employee_expenses.should eq 94799000
    ninemonths_result.gross_profit.should eq 2299070000
  end
end
