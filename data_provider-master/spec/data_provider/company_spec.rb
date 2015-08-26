require 'spec_helper'

describe DataProvider::Company, :mongoid do
  let(:company) { create :'data_provider/company', :ticker_name => 'TICK' }
  let(:share_holding) { create :'data_provider/share_holding', :company_code => company.code }

  subject { company }

  it "should get the company record" do
    DataProvider::Company.find_or_initialize_by( code: company.code ).should eq company
  end

  it "should have a share holding" do
    share_holding.save
    subject.share_holding.should eq share_holding
  end

  it "should have 52w high/low price for NSE", :mongoid do
    create :'data_provider/listing', :exchange_code => 50, :scrip_code1_given_by_exchange => "#{company.nse_code}EQ", :fifty_two_week_high => 100.24, :low_date => "31/01/2012"
    company.nse_listing.fifty_two_week_high.should eq 100.24
    company.nse_listing.low_date.should eq Date.parse("31/01/2012")
  end

  it "should have 52w high/low price for BSE", :mongoid do
    company.update_attributes( bse_code1: "5124234")
    create :'data_provider/listing', :exchange_code => 47, :scrip_code1_given_by_exchange => company.bse_code1, :fifty_two_week_low => 98.62, :high_date => "31/01/2012"

    company.bse_listing.fifty_two_week_low.should eq 98.62
    company.bse_listing.high_date.should eq Date.parse("31/01/2012")
  end

  it "should get nse open price as nil", :redis do
    subject.nse.open_price.should eq nil
  end

  it "should get bse open price as nil", :redis do
    subject.bse.open_price.should eq nil
  end

  it "should ordered by company name" do
    create :'data_provider/company', name: "FOO"
    create :'data_provider/company', name: "BAR"
    DataProvider::Company.ordered.map(&:name).should eq ["BAR", "FOO"]
  end

  describe "with nse scrip", :redis do
    before :each do
      create :'data_provider/nse_scrip', :id => company.nse_code, :last_traded_price => 24, :close_price => 23
    end

    its(:current_price) { should be_a_indian_currency_of 24 }

    it "should have close_price for nse" do
      subject.nse.close_price.should be_a_indian_currency_of 23
    end
  end

  describe "with bse scrip", :redis do
    before :each do
      create :'data_provider/bse_scrip', :id => company.ticker_name, :last_traded_price => 15, :close_price => 14.5
    end

    its(:current_price)         { should be_a_indian_currency_of 15   }
  end

  describe "stock screener search" do
    before(:each) do
      create :'data_provider/company', pe: 1,  eps: 1,  price_to_book_value: 1,  book_value: 1,  :industry_name => "FOO"
      create :'data_provider/company', pe: 2,  eps: 2,  price_to_book_value: 2,  book_value: 2,  :industry_name => "BAR"
      create :'data_provider/company', pe: 2,  eps: 3,  price_to_book_value: 3,  book_value: 3,  :industry_name => "FOO"
      create :'data_provider/company', pe: 10, eps: 20, price_to_book_value: 20, book_value: 20, :industry_name => "FOO"
    end

    it "should return stock based on pe criteria" do
      test_named_scope(DataProvider::Company.all, DataProvider::Company.screener_search({:pe_lt => 2, :pe_gt => 1}), lambda{|company| company.pe <=  2 && company.pe >= 1 })
    end

    it "should return stock based on eps criteria" do
      test_named_scope(DataProvider::Company.all, DataProvider::Company.screener_search({:eps_lt => 2, :eps_gt => 1}), lambda{|company| company.eps <=  2 && company.eps >= 1 })
    end

    it "should return stock based on price to book value criteria" do
      test_named_scope(DataProvider::Company.all, DataProvider::Company.screener_search({:price_to_book_value_lt => 2, :price_to_book_value_gt => 1}),
                                    lambda{|company| company.price_to_book_value <=  2 && company.price_to_book_value >= 1 })
    end

    it "should return stock based on book value criteria" do
      test_named_scope(DataProvider::Company.all, DataProvider::Company.screener_search({:book_value_lt => 2, :book_value_gt => 1}),
                                    lambda{|company| company.book_value <=  2 && company.book_value >= 1 })
    end

    it "should return stock based on book value criteria" do
      test_named_scope(DataProvider::Company.all, DataProvider::Company.screener_search({:industry_name => "FOO"}),
                                    lambda{|company| company.industry_name == "FOO" })
    end
  end
end
