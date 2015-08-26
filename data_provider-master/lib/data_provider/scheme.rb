module DataProvider
	class Scheme
		include Mongoid::Document
		include Mongoid::Search
    include Mongoid::Slug
    include CurrencyFormatter
    include PercentageFormatter

		field :security_code
		field :code # from NavMaster.xml
		field :name
		field :company_code
		field :asset_management_company_code
		field :type, :type => Integer
		field :type_description
		field :launch_date, :type => DateTime
		field :plan_code, :type => Integer
		field :plan_description
		field :class_code, :type => Integer
		field :class_description
		field :open_date, :type => DateTime
		field :close_date, :type => DateTime
		field :redemption_date, :type => DateTime
		field :minimum_investment_amount, :type => Integer
		field :initial_price, :type => Float
		field :initial_price_uom, :type => Integer
		field :initial_price_uom_description
		field :size, :type => Float
		field :size_uom, :type => Integer
		field :size_uom_description
		field :offer_price, :type => Float
		field :amount_raised, :type => Float
		field :amount_raised_uom, :type => Integer
		field :amount_raised_uom_description
		field :fund_manager_prefix
		field :fund_manager_name
		field :listing_information
		field :entry_load
		field :exit_load
		field :redemption_frequency
		field :sip
		field :product_code, :type => Integer
		field :modified_date, :type => DateTime
		field :delete_flag
		###### from NavMaster.xml
		field :ticker_name     #take :ticker from Navcps.xml
		field :mapping_code
		field :map_name
		field :issue_price, :type => Float
		field :description
		field :issue_date, :type => DateTime
		field :expiry_date, :type => DateTime
		field :face_value, :type => Float
		field :market_lot, :type => Float
		field :isin_code
		field :bench_mark_index
		field :bench_mark_index_name
### from Navcps.xml
		field :datetime, :type => DateTime
		field :nav_amount, :type => Float
		field :repurchase_load, :type => Integer
		field :repurchase_price, :type => Float
		field :sale_load, :type => Integer
		field :sale_price, :type => Float
		field :prev_nav_amount, :type => Float
		field :prev_repurchase_price, :type => Float
		field :prev_sale_price, :type => Float
		field :percentage_change, :type => Float
		field :prev1_week_amount, :type => Float
		field :prev1_week_percent, :type => Float
		field :prev1_month_amount, :type => Float
		field :prev1_month_percent, :type => Float
		field :prev3_months_amount, :type => Float
		field :prev3_months_percent, :type => Float
		field :prev6_months_amount, :type => Float
		field :prev6_months_percent, :type => Float
		field :prev9_months_amount, :type => Float
		field :prev9_months_percent, :type => Float
		field :prev_year_amount, :type => Float
		field :prev_year_percent, :type => Float
		field :prev2_year_amount, :type => Float
		field :prev2_year_percent, :type => Float
		field :prev2_year_comp_percent, :type => Float
		field :prev3_year_amount, :type => Float
		field :prev3_year_percent, :type => Float
		field :prev3_year_comp_percent, :type => Float
		field :list_date, :type => DateTime
		field :list_amount, :type => Float
		field :list_percent, :type => Float
		field :rank, :type => Integer

		field :objective #from MfObjective.xml

    index :security_code, :unique => true, :background => true
    index :name, :unique => true, :background => true

    EQUITY_CLASS_CODES = [ 2120, 2119, 2389, 2097, 2388 ] # Diversified, ELSS, Index, Balanced, Sector

    slug :name

    scope :active, where(delete_flag: "False")
    scope :equity_funds, where(:class_code.in => EQUITY_CLASS_CODES)

		search_in :name, { :match => :all }

    validates_presence_of :security_code, :name

		CATEGORY_METHODS = [ :one_day_return, :one_week_return, :one_month_return, :three_months_return, :six_months_return, :nine_months_return, :one_year_return,
			:two_year_return, :three_year_return ]
		delegate *CATEGORY_METHODS, :to => :category_wise_net_asset_value_detail, :allow_nil => true

		scope :ordered, order_by([[:name, :asc]])

		delegate :company_name, :to => :asset_management_company, :allow_nil => true
		delegate :dividend_date, :to => :mf_dividend_detail, :allow_nil => true

    monetize :initial_price, :offer_price, :amount_raised, :amount_raised_uom, :issue_price, :face_value, :market_lot, :nav_amount, :repurchase_price,
    :sale_price, :prev_nav_amount, :prev_repurchase_price, :prev_sale_price, :prev1_week_amount, :prev1_month_amount, :prev3_months_amount, :prev6_months_amount,
    :prev9_months_amount, :prev_year_amount, :prev2_year_amount, :prev3_year_amount, :list_amount

    percentize :percentage_change, :prev1_week_percent, :prev1_month_percent, :prev3_months_percent, :prev6_months_percent,
               :prev9_months_percent, :prev_year_percent, :prev2_year_percent, :prev2_year_comp_percent, :prev3_year_percent,
               :prev3_year_comp_percent, :list_percent

    percentize :size # rounding only
    def asset_management_company
			AssetManagementCompany.where(company_code: company_code).first
		end

		def mf_dividend_detail
			MfDividendDetail.all(conditions: { security_code: security_code }, sort: [[ :dividend_date, :desc ]]).first
		end

		def dividend_percentage
			mf_dividend_detail.percentage if mf_dividend_detail
		end

		def day_change
		 (nav_amount - prev_nav_amount) if nav_amount && prev_nav_amount
		end

		def category_wise_net_asset_value_detail
			NetAssetValueCategory.all(conditions: { scheme_class_code: class_code }, sort: [[ :modified_date, :desc ]]).first
		end

		def scheme_portfolio
			MfSchemeWisePortfolio.all( conditions: { security_code: security_code }, sort: [[ :holding_date, :desc ]]).first
		end

		def portfolio_holdings
			[ scheme_portfolio.element ].flatten.sort_by { |hsh| -hsh["Percentage"].to_f } if scheme_portfolio
		end

		def asset_allocation
			return nil if !scheme_portfolio
			groupwise_percentage = Hash.new(0.0)
			portfolio_holdings.each { |portfolio| groupwise_percentage[portfolio["InstrumentName"]] += portfolio["Percentage"].to_f }
			groupwise_percentage.each_key { |k| groupwise_percentage[k] = groupwise_percentage[k].round(2) }
		end

		def equity_holdings
			portfolio_holdings.select { |p| p["InstrumentCode"] == "2089" } if portfolio_holdings && portfolio_holdings.length > 0
		end

		def industry(industry_code)
			Industry.where( code: industry_code ).first
		end

		def broad_industry_name(industry_code)
			industry(industry_code).broad_industry_name if industry(industry_code)
		end

		def sectoral_allocation
			return nil unless equity_holdings && equity_holdings.length > 0
			allocation = Hash.new(0.0)
			equity_holdings.each { |p|  allocation[broad_industry_name(p["IndustryCode"])]+= p["Percentage"].to_f if broad_industry_name(p["IndustryCode"]) }
			allocation.each_key { |k| allocation[k] = allocation[k].round(2) }
			allocation.sort_by { |k,v| -v }.take(10)
		end
	end
end
