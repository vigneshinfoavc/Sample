require 'spec_helper'

describe Dion::Ratios do

  it "should create/update Ratio record" do
    Dion::Ratios.find_and_update_attributes( :company_code => '17020498', :year_ending => '31/03/2011',
                                              months: 12,
                                              adjusted_eps: "0.0585",
                                              long_term_assets: "0.4147" )
    (ratio = DataProvider::Ratio.where( company_code: "17020498", year_ending: Date.parse("31/03/2011"), months: 12 ).first).should_not be_nil
    ratio.adjusted_eps.should eq 0.0585
    ratio.long_term_assets.should eq 0.4147
  end
end
