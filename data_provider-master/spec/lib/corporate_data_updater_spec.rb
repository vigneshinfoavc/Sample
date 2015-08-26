require 'spec_helper'
require 'corporate_data_updater'

describe CorporateDataUpdater, :mongoid, :vcr do
  let(:corporate_data_updater) {
    corporate_data_updater = nil
    Timecop.freeze(Time.parse("2012-02-10 23:00:00 +530")) do
      corporate_data_updater = CorporateDataUpdater.new
    end
    corporate_data_updater
  }

  subject { corporate_data_updater }

  it "should have a AccountingPolicy record" do
    subject.parse_and_update("AccountingPolicy.xml")
    DataProvider::AccountingPolicy.exists?( conditions: { company_code: "17020498", year_ending: "31/03/2011" } ).should be_true
  end

  it "should have a AnnouncementsAGMBC record" do
    subject.parse_and_update("AnnouncementsAGMBC.xml")
    DataProvider::AnnouncementsAgmbc.exists?( conditions: { company_code: "11510001", date_of_announcement: Date.parse("09/02/2012"), source_code: 711 } ).should be_true
  end

  it "should have a AnnouncementsBoardMeeting record" do
    subject.parse_and_update("AnnouncementsBoardMeeting.xml")
    DataProvider::AnnouncementsBoardMeeting.exists?( conditions: { company_code: "14040025" , brd_date: Date.parse("25/01/2012"), src_code: 584 } ).should be_true
  end

  it "should have a AuditorsReport record" do
    subject.parse_and_update("AuditorsReport.xml")
    DataProvider::AuditorsReport.exists?( conditions: { company_code: "17020538", year_ending: "31/03/2010" } ).should be_true
  end

  it "should have a Audited Result Record" do
    subject.parse_and_update("AuditedResults.xml")
    DataProvider::AuditedResult.exists?(conditions: { company_code: "11080004",
                                        year_ending: Date.parse("31/03/2011"),
                                        admin_expenses: 94799000,
                                        imported_rawmaterials: 2299070000,
                                        cash_and_bank_balance: 86741000 } ).should be_true
  end

  it "should have a banking ratio record" do
    subject.parse_and_update("BankingRatios.xml")
    DataProvider::BankingRatio.exists?( conditions: { company_code: "14030018",
                                        year_ending: "31/03/2011",
                                        months: 12,
                                        net_profit_per_branch: "0.6906" } ).should be_true
  end

  it "should have a BsePrice record" do
    subject.parse_and_update("BSEPrice.xml")
    DataProvider::BsePrice.exists?( conditions: { security_code: "017023928.00026005001", price_date: "10/02/2012", close_price: 9304.31 } ).should be_true
  end

  it "should have a Capitalstructure record" do
    subject.parse_and_update("Capitalstructure.xml")
    DataProvider::Capitalstructure.exists?( conditions: { company_code: "11020009", modify_on: "27 Feb 2009 16:14:59" } ).should be_true
  end

  it "should have a CashFlow record" do
    subject.parse_and_update("CashFlow.xml")
    DataProvider::CashFlow.exists?( conditions: { company_code: "16610155", year_ending: "31/03/2011", type: "A", months: 12, profits_before_tax: "-247796"  } ).should be_true
  end

  it "should have a CompanyMaster record" do
    subject.parse_and_update("CompanyMaster.xml")
    DataProvider::Company.exists?( conditions: { code: "11550030", product_status_code: "1753" } ).should be_true
  end

  it "should add CurrDetails to Company" do
    create :'data_provider/company', code: "13520030"
    subject.parse_and_update("CurrDetails.xml")
    company = DataProvider::Company.find_by_code("13520030")
    company.pe.should eq 34.44
    company.dividend_yield.should eq 0.91
    company.eps.should eq 6.22
  end

  it "should have a CorpGovernancereport record" do
    subject.parse_and_update("CorpGovernancereport.xml")
    DataProvider::CorpGovernancereport.exists?( conditions: { company_code: "11610052", year_ending: "31/03/2011" } ).should be_true
  end

  it "should have a DirectorsReport record" do
    subject.parse_and_update("DirectorsReport.xml")
    DataProvider::DirectorsReport.exists?( conditions: { company_code: "14010016", year_ending: "31/03/2011" } ).should be_true
  end

  it "should have a Dividend record" do
    subject.parse_and_update("Dividend.xml")
    DataProvider::Dividend.exists?( conditions: { company_code: "11510001", date_of_announcement: "09/02/2012", percentage: "170" } ).should be_true
  end

  it "should have a HalfyearlyResults record" do
    subject.parse_and_update("HalfyearlyResults.xml")
    DataProvider::HalfyearlyResult.exists?( conditions: { company_code: "10680017",
                                            year_ending: "31/12/2011",
                                            months: 6,
                                            half: 1,
                                            gross_profit: "3011000",
                                            employee_expenses: "354000"} ).should be_true
  end

  it "should have a IndividualHolding record" do
    subject.parse_and_update("IndividualHolding.xml")
    DataProvider::IndividualHolding.exists?( conditions: { company_code: "10650004",
                                             share_holding_date: "31/12/2011" } ).should be_true
  end

  it "should have a IndustryMaster record" do
    subject.parse_and_update("IndustryMaster.xml")
    DataProvider::Industry.exists?( conditions: { code: 103, broad_industry_code: 56, major_sector_code: 390, major_sector_name: "General" } ).should be_true
  end

  it "should have a KeyExecutive record" do
    subject.parse_and_update("KeyExecutives.xml")
    DataProvider::KeyExecutive.exists?( conditions: { company_code: "11020009",
                                        modify_on: "10/02/2012 11:21" } ).should be_true

  end

  it "should have a listing master record" do
    subject.parse_and_update("ListingMaster.xml")
    DataProvider::Listing.exists?(conditions: { security_code: "014070078.00005001001",
                                  scrip_code1_given_by_exchange: "532117",
                                  fifty_two_week_high: 0.43,
                                  low_date: "23/01/2012" } ).should be_true
  end

  it "should have a News record" do
    subject.parse_and_update("News.xml")
    DataProvider::News.exists?( conditions: { company_code: "230",
                                news_date: "10/02/2012",
                                headlines: "Indian refiners seek 2.6 million barrels extra supplies from Saudi Aramco: Sources",
                                source_name: "Religare Technova" } ).should be_true
  end

  it "should have a NinemonthsResult record" do
    subject.parse_and_update("NinemonthsResults.xml")
    DataProvider::NinemonthsResult.exists?( conditions: { company_code: "10560013",
                                            year_ending: "31/12/2011",
                                            months: 9,
                                            nine: 1,
                                            operating_income: "211490000",
                                            equity_capital: "79161000",
                                            eps: 2.134 } ).should be_true
  end

  it "should have a NotesToAccount record" do
    subject.parse_and_update("NotesToAccount.xml")
    DataProvider::NotesToAccount.exists?( conditions: { company_code: "17020538", year_ending: "31/03/2010" } ).should be_true
  end

  it "should have a NsePrice record" do
    subject.parse_and_update("NSEPrice.xml")
    DataProvider::NsePrice.exists?( conditions: { security_code: "017023929.00026005010",
                                    price_date: "10/02/2012",
                                    high_price: 19,
                                    close_price: 19,
                                    traded_value: 0,
                                    traded_quantity: 0 } ).should be_true
  end

  it "should have a Product record" do
    subject.parse_and_update("Products.xml")
    record = DataProvider::Product.where( company_code: "11020009", year_ending: "31/03/2010", no_of_months: 12 ).first
    record.element.first["ProductCode"].should eq "100190.0205"
    record.element.first["OpeningValue"].should eq nil
    record.element.first["ProductName"].should eq "Wheat Items"
  end

  it "should have a QuarterlyResult record" do
    subject.parse_and_update("QuarterlyResults.xml")
    record = DataProvider::QuarterlyResult.where( company_code: "10520003",
                                    year_ending: "31/12/2011",
                                    months: 3,
                                    quarter: 3 ).first
    record.operating_income.to_i.should eq 83868100000
    record.gross_profit.to_i.should eq 10548700000
    record.reported_pat.to_i.should eq 6621500000
  end

  it "should have a Ratio record" do
    subject.parse_and_update("Ratios.xml")
    record = DataProvider::Ratio.where( company_code: "12540153",
                          year_ending: "31/03/2011",
                          months: 12,
                          adjusted_eps: "0.0585",
                          long_term_assets: "0.4147",
                          net_profit_margin: "0.57",
                          operating_cash_flow_to_sales_ratio: "-0.0011" ).first
    record.type.should eq "A"
  end

  it "should have a Rawmaterial record" do
    subject.parse_and_update("Rawmaterial.xml")
    raw_material = DataProvider::Rawmaterial.where( company_code: "11020009", year_ending: "31/03/2010")
    raw_material.first.element["ProductCode"].to_f.should eq 999999.1224
    raw_material.first.element["ProdMix"].to_f.should eq 100
  end

  it "should have a ShareHolding record" do
    subject.parse_and_update("ShareHolding.xml")
    share_holding = DataProvider::ShareHolding.where( company_code: "10560013", share_holding_date: "31/12/2011" )
    share_holding.first.element.first["NoOfShareHolders"].to_i.should eq 5406
    share_holding.first.element.first["DistinctiveNumbers"].should eq "1 to 7916167"
    share_holding.first.element.first["EquityShareHold"].to_i.should eq 59665
  end

  it "should have a Split record" do
    subject.parse_and_update("Splits.xml")
    DataProvider::Split.exists?( conditions: { company_code: "14010105" } ).should be_true
  end

  it "should have a Subsidiary record" do
    subject.parse_and_update("Subsidiaries.xml")
    DataProvider::Subsidiary.exists?( conditions: { company_code: "13191258", company_name: "Kautilya Infotech Ltd.", parent_company_code: "16030148" } ).should be_true
  end

  # Mutual fund data specs
  it "should have a Scheme record" do
    subject.parse_and_update("SchemeMaster.xml")
    DataProvider::Scheme.exists?( conditions: { security_code: "14051233.002199",
                                  company_code: "14051231",
                                  type_description: "Open Ended",
                                  initial_price_uom: 763,
                                  fund_manager_name: "Aniket Inamdar",
                                  minimum_investment_amount: "5000",
                                  sip: "True" } ).should be_true

  end

  it "should have a FundMaster record" do
    subject.parse_and_update("FundMaster.xml")
    DataProvider::AssetManagementCompany.exists?( conditions: { company_code: '14051231',
                                                  company_name: 'Deutsche Mutual Fund',
                                                  code: '14051232',
                                                  name: 'Deutsche Asset Management (India) Pvt. Ltd.',
                                                  incorporation_date: Date.parse('21/03/2002') } ).should be_true
  end

  it "should have a MFObjective record" do
    create :'data_provider/scheme', security_code: "14051233.002199"
    subject.parse_and_update("MFObjectives.xml")
    record = DataProvider::Scheme.where( security_code: "14051233.002199" ).first
    record.objective.should eq "An open-ended equity scheme with the objective to generate long-term capital growth from investment in a diversified portfolio of equity and equity related securities."
  end

  it "should have a NavMaster fields in Scheme" do
    create :'data_provider/scheme', security_code: "14051233.002199"
    subject.parse_and_update("NavMaster.xml")
    record = DataProvider::Scheme.where( security_code: "14051233.002199" ).first
    record.code.should eq '14051233'
    record.bench_mark_index_name.should eq "NSE Index"
  end

  it "should have a Navcp record" do
    create :'data_provider/scheme', security_code: "14051233.002199"
    subject.parse_and_update("NAVCP.xml")
    DataProvider::Scheme.exists?( conditions: { security_code: "14051233.002199",
                                  ticker_name: "Sahara Tax Gain (D)",
                                  nav_amount: "13.6985",
                                  prev1_week_amount: "13.5208",
                                  prev3_year_percent: "44.2554759898905",
                                  prev9_months_amount: "13.7376",
                                  prev3_months_percent: "3.85046927357361" } ).should be_true
  end

  it "should have a NavCategoryDetail record" do
    subject.parse_and_update("NAVCategoryDetails.xml")
    DataProvider::NetAssetValueCategory.exists?( conditions: { scheme_class_code: "2120",
                                                 scheme_class_description: "Equity - Diversified",
                                                 no_of_schemes: 288,
                                                 one_month_return: "6.1578",
                                                 three_year_return: "61.448" } ).should be_true
  end

  it "should have a MFdividendDetail record" do
    subject.parse_and_update("MFDividendDetails.xml")
    DataProvider::MfDividendDetail.exists?( conditions: { security_code: "14050439.002067",
                                            dividend_date: "15/02/2012",
                                            dividend_type: "2073",
                                            percentage: "30" } ).should be_true
  end

  it "should have a MFSchemewisePortfolio record" do
    subject.parse_and_update("MFSchemeWisePortfolio.xml")
    record = DataProvider::MfSchemeWisePortfolio.where( security_code: "14050284.002066", holding_date: "31/01/2012" )
    record.first.element.first["PortfolioUOM"].to_f.should eq 838
    record.first.element.first["InvestedCompanyName"].should eq "Cash and other assets"
    record.first.element.first["MarketValue"].to_f.should eq 56.529
  end

  it "should have a MFBonusDetail record" do
    subject.parse_and_update("MFBonusDetails.xml")
    DataProvider::MfBonusDetail.exists?( conditions: { security_code: "14051233.002199",
                                         bonus_date: "28/09/2007",
                                         ratio_offered: 1.4,
                                         ratio_existing: 1000 } ).should be_true
  end

end
