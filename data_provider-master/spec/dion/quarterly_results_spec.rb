require 'spec_helper'

describe Dion::QuarterlyResults do

  it "should create/update QuarterlyResult record" do
    Dion::QuarterlyResults.find_and_update_attributes( :company_code => '17020498', :year_ending => '31/03/2011',
                                                        :months => '3', :quarter => '1',
                                                        :employee_expenses => "94799000",
                                                        :gross_profit => "2299070000" )
    (quarterly_result = DataProvider::QuarterlyResult.where( company_code: "17020498", year_ending: "31/03/2011" ).first).should_not be_nil
    quarterly_result.months.should eq 3
    quarterly_result.employee_expenses.should eq 94799000
    quarterly_result.gross_profit.should eq 2299070000
  end
end
