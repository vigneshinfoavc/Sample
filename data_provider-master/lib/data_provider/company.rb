module DataProvider
	class Company
		include Mongoid::Document
		include Mongoid::Search
    include Mongoid::Slug

		field :code
		field :name
		field :short_name
		field :ticker_name
		field :industry_code, :type => Integer
		field :industry_name
		field :business_group_code, :type => Integer
		field :business_group_name
		field :incorporation_date, :type => DateTime
		field :first_public_issue_date, :type => DateTime
		field :major_sector, :type => Integer
		field :isin_code
		field :security_code
		field :bse_code1
		field :bse_code2
		field :nse_code
		field :product_status_code
		field :modified_date, :type => DateTime
		field :delete_flag
		# from CurrDetails.xml
		field :pe, :type => Float
		field :eps, :type => Float
		field :price_to_book_value, :type => Float
		field :book_value, :type => Float
		field :face_value, :type => Float
		field :market_capitalization, :type => Integer
		field :dividend_yield, :type => Float

    # Custom field
    field :nse_indices
    field :bse_indices

    index :code,                :background => true, :unique => true
    index :name,                :background => true, :unique => true
    index :ticker_name,         :background => true
    index :nse_code,            :background => true
    index :bse_code1,           :background => true
    index :product_status_code, :background => true
    index :pe,                  :background => true
    index :eps,                 :background => true
    index :price_to_book_value, :background => true

		search_in :name, :industry_name, :bse_code1, :bse_code2, :nse_code, { :match => :all }

    slug :name

		validates_presence_of :code, :name
		validates_uniqueness_of :code, :name

		scope :stocks, where(:product_status_code.ne => "2161").any_of( { :nse_code.nin => [nil, ""]}, { :bse_code1.nin => [ nil, ""] } )
		scope :nse_stocks, where(:product_status_code.ne => "2161", :nse_code.nin => [nil, ""])
		scope :ordered, order_by([[:name, :asc]])

		scope :pe_range, lambda {|min,max| where(:pe.gte => min, :pe.lte => max) }
		scope :eps_range, lambda {|min,max| where(:eps.gte => min, :eps.lte => max) }
		scope :price_to_book_value_range, lambda {|min,max| where(:price_to_book_value.gte => min, :price_to_book_value.lte => max) }
		scope :book_value_range, lambda {|min,max| where(:book_value.gte => min, :book_value.lte => max) }

		alias :sector :industry_name

		def nse
			NseScrip.find(nse_code) || CustomNil
		end

		def bse
			BseScrip.find(bse_code1) || CustomNil
		end

		def nse_listing
			Listing.nse.any_of( { scrip_code1_given_by_exchange: "#{nse_code}EQ" }, { scrip_code1_given_by_exchange: "#{nse_code}BE"} ).first || CustomNil
		end

		def bse_listing
			Listing.bse.where( scrip_code1_given_by_exchange: bse_code1 ).first || CustomNil
		end

		def current_price
			nse.last_traded_price || bse.last_traded_price
		end

		def self.find_by_code(code)
			where(code: code).first
		end

		def self.find_by_name(name)
			where( name: name ).first
		end

		def share_holding
			ShareHolding.all(conditions: { company_code: code }, sort: [[ :share_holding_date, :desc ]], limit: 1).first
		end

		def self.screener_search(params)
			company = Company.stocks
			company = company.csearch(params[:industry_name]) if params[:industry_name] && params[:industry_name].size > 0
			company = company.eps_range(params[:eps_gt], params[:eps_lt]) if params[:eps_gt] && params[:eps_lt] && params[:eps_lt].size > 0
			company = company.pe_range(params[:pe_gt], params[:pe_lt]) if params[:pe_gt] && params[:pe_lt] && params[:pe_lt].size > 0
			company = company.price_to_book_value_range(params[:price_to_book_value_gt], params[:price_to_book_value_lt]) if params[:price_to_book_value_gt] && params[:price_to_book_value_gt] && params[:price_to_book_value_gt].size > 0
			company = company.book_value_range(params[:book_value_gt], params[:book_value_lt]) if params[:book_value_gt] && params[:book_value_gt] && params[:book_value_gt].size > 0
			company
		end

		class CustomNil < NilClass
			def self.method_missing(*)
				nil
			end
		end
	end
end
