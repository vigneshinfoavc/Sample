require 'mongoid'
require 'mongoid_search'
require 'mongoid_slug'
require 'money'
require 'redis'
require 'currency_formatter'
require 'percentage_formatter'

module DataProvider
  Dir[File.expand_path("../../config/initializers/**/*.rb", __FILE__)].each {|f| require f}
  autoload :VERSION, File.expand_path('../version', __FILE__)

  autoload :AccountingPolicy,          File.expand_path('../data_provider/accounting_policy.rb',           __FILE__)
  autoload :AnnouncementsAgmbc,        File.expand_path('../data_provider/announcements_agmbc.rb',         __FILE__)
  autoload :AnnouncementsBoardMeeting, File.expand_path('../data_provider/announcements_board_meeting.rb', __FILE__)
  autoload :AssetManagementCompany,    File.expand_path('../data_provider/asset_management_company.rb',    __FILE__)
  autoload :AuditedResult,             File.expand_path('../data_provider/audited_result.rb',              __FILE__)
  autoload :AuditorsReport,            File.expand_path('../data_provider/auditors_report.rb',             __FILE__)
  autoload :BankingRatio,              File.expand_path('../data_provider/banking_ratio.rb',               __FILE__)
  autoload :Bonus,                     File.expand_path('../data_provider/bonus.rb',                       __FILE__)
  autoload :BsePrice,                  File.expand_path('../data_provider/bse_price.rb',                   __FILE__)
  autoload :BseScrip,                  File.expand_path('../data_provider/bse_scrip.rb',                   __FILE__)
  autoload :BseTopListingCompany,      File.expand_path('../data_provider/bse_top_listing_company.rb',     __FILE__)
  autoload :Capitalstructure,          File.expand_path('../data_provider/capitalstructure.rb',            __FILE__)
  autoload :CashFlow,                  File.expand_path('../data_provider/cash_flow.rb',                   __FILE__)
  autoload :Company,                   File.expand_path('../data_provider/company.rb',                     __FILE__)
  autoload :CustomNil,                 File.expand_path('../data_provider/company.rb',                     __FILE__)
  autoload :CorpGovernancereport,      File.expand_path('../data_provider/corp_governancereport.rb',       __FILE__)
  autoload :DirectorsReport,           File.expand_path('../data_provider/directors_report.rb',            __FILE__)
  autoload :Dividend,                  File.expand_path('../data_provider/dividend.rb',                    __FILE__)
  autoload :HalfyearlyResult,          File.expand_path('../data_provider/halfyearly_result.rb',           __FILE__)
  autoload :IndicesMaster,             File.expand_path('../data_provider/indices_master.rb',              __FILE__)
  autoload :IndividualHolding,         File.expand_path('../data_provider/individual_holding.rb',          __FILE__)
  autoload :Industry,                  File.expand_path('../data_provider/industry.rb',                    __FILE__)
  autoload :KeyExecutive,              File.expand_path('../data_provider/key_executive.rb',               __FILE__)
  autoload :Listing,                   File.expand_path('../data_provider/listing.rb',                     __FILE__)
  autoload :MfBonusDetail,             File.expand_path('../data_provider/mf_bonus_detail.rb',             __FILE__)
  autoload :MfDividendDetail,          File.expand_path('../data_provider/mf_dividend_detail.rb',          __FILE__)
  autoload :MfSchemeWisePortfolio,     File.expand_path('../data_provider/mf_scheme_wise_portfolio.rb',    __FILE__)
  autoload :NetAssetValueCategory,     File.expand_path('../data_provider/net_asset_value_category.rb',    __FILE__)
  autoload :NewsArticle,               File.expand_path('../data_provider/news_article.rb',                __FILE__)
  autoload :News,                      File.expand_path('../data_provider/news.rb',                        __FILE__)
  autoload :NinemonthsResult,          File.expand_path('../data_provider/ninemonths_result.rb',           __FILE__)
  autoload :NotesToAccount,            File.expand_path('../data_provider/notes_to_account.rb',            __FILE__)
  autoload :NsePrice,                  File.expand_path('../data_provider/nse_price.rb',                   __FILE__)
  autoload :NseScrip,                  File.expand_path('../data_provider/nse_scrip.rb',                   __FILE__)
  autoload :NseTopListingCompany,      File.expand_path('../data_provider/nse_top_listing_company.rb',     __FILE__)
  autoload :Product,                   File.expand_path('../data_provider/product.rb',                     __FILE__)
  autoload :QuarterlyResult,           File.expand_path('../data_provider/quarterly_result.rb',            __FILE__)
  autoload :Ratio,                     File.expand_path('../data_provider/ratio.rb',                       __FILE__)
  autoload :Rawmaterial,               File.expand_path('../data_provider/rawmaterial.rb',                 __FILE__)
  autoload :SandPCNXNiftyCompany,      File.expand_path('../data_provider/sandp_cnx_nitfy_company.rb',     __FILE__)
  autoload :Scheme,                    File.expand_path('../data_provider/scheme.rb',                      __FILE__)
  autoload :Scrip,                     File.expand_path('../data_provider/scrip.rb',                       __FILE__)
  autoload :ShareHolding,              File.expand_path('../data_provider/share_holding.rb',               __FILE__)
  autoload :Split,                     File.expand_path('../data_provider/split.rb',                       __FILE__)
  autoload :Subsidiary,                File.expand_path('../data_provider/subsidiary.rb',                  __FILE__)

# Loads the constant like methods
# autoload :Gold,                      File.expand_path('../data_provider/gold.rb',                        __FILE__)
# autoload :Nifty,                     File.expand_path('../data_provider/nifty.rb',                       __FILE__)
# autoload :Sensex,                    File.expand_path('../data_provider/sensex.rb',                      __FILE__)
  def self.const_missing(name)
    file = name.to_s.downcase
    require File.expand_path("../data_provider/#{file}.rb", __FILE__)
    raise "Class not found: #{name}" unless self.respond_to? name
    self.send name
  end
end
