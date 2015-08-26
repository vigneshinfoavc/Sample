require 'spec_helper'

describe DataProvider::Scheme do
  let(:scheme) { create :'data_provider/scheme', :objective => "MyObjective",:bench_mark_index_name => "Crisil Liquid Fund Index" }
  let(:amc) { create :'data_provider/asset_management_company', :company_code => scheme.company_code, :company_name => "HDFC Mutual Fund" }
  let(:mf_dividend_detail) { create :'data_provider/mf_dividend_detail', :security_code => scheme.security_code }
  let(:nav_category_detail) { create :'data_provider/net_asset_value_category', :scheme_class_code => scheme.class_code }
  let(:mf_scheme_wise_portfolio) { create :'data_provider/mf_scheme_wise_portfolio', :security_code => scheme.security_code }

  subject { scheme }

  its(:objective) { should eq scheme.objective }
  its(:company_name) { should eq amc.company_name }
  its(:bench_mark_index_name) { should eq scheme.bench_mark_index_name }
  its(:dividend_percentage) { should eq mf_dividend_detail.percentage }
  its(:dividend_date) { should eq mf_dividend_detail.dividend_date }
  its(:one_day_return) { should eq nav_category_detail.one_day_return }
  its(:one_year_return) { should eq nav_category_detail.one_year_return }
  it "should have portfolio_holdings" do
    mf_scheme_wise_portfolio.save
    subject.portfolio_holdings.should include ({"PortfolioUOM"=>"838",
      "PortfolioUOMDescription"=>"Crores",
      "InvestedCompanyCode"=>"0",
      "InvestedCompanyName"=>"Axis Bank Ltd.",
      "IndustryCode"=>"0",
      "IndustryName"=>nil,
      "InstrumentCode"=>"2356",
      "InstrumentName"=>"Bills Rediscounting",
      "ListingInformation"=>"False",
      "Percentage"=>"5.05",
      "IsItNPA"=>"False",
      "MarketValue"=>"84.355",
      "Rating"=>"CRISILA1+",
      "RatingAgencyCode"=>"0",
      "RatingAgencyName"=>nil,
      "NetAsset"=>"0",
      "Modifyon"=>"14/02/2012 10:32",
      "RowId"=>"1"} )
  end

  it "should ordered by scheme name" do
    subject.update_attributes(name: "FOO")
    create :'data_provider/scheme', name: "BAR"
    DataProvider::Scheme.ordered.map(&:name).should eq ["BAR", "FOO"]
  end

  it "should have active schemes" do
    scheme = create :'data_provider/scheme', :delete_flag => true
    2.times { create :'data_provider/scheme' }
    DataProvider::Scheme.active.should_not include scheme
    DataProvider::Scheme.active.count.should eq 2
  end

  it "should have equity funds" do
    equity_schemes = [ 2120, 2119, 2389, 2097, 2388 ].map { |code| create :'data_provider/scheme', :class_code => code }
    non_equity_schemes = [1,1].map { |s| create :'data_provider/scheme', :class_code => 2200 }
    DataProvider::Scheme.equity_funds.should include *equity_schemes
    DataProvider::Scheme.equity_funds.should_not include *non_equity_schemes
  end

  it "should have monetize amount" do
    scheme = create :'data_provider/scheme', :prev_year_amount => 10000.80
    scheme.prev_year_amount.should be_a_indian_currency_of 10000.80
  end

  it "should percentize given percents" do
    scheme = create :'data_provider/scheme', :percentage_change => 10.865477453
    scheme.percentage_change.should eq BigDecimal.new("10.87")
  end
end
