require 'redis_record'

module DataProvider
	class NseScrip < RedisRecord
		include Scrip
    include CurrencyFormatter

		integer   :volume
		decimal   :last_traded_price, :open_price, :high_price, :low_price, :close_price,
							:percent_change, :net_change
		string    :id    #nse_code
		datetime  :time

		def company
			Company.where( nse_code: id).first
		end

    TOP_500_COMPANY_LIST = DataProvider::NseTopListingCompany.all.map(&:id)

		BROAD_INDICES = [
      "NSESMALL", "CNX200", "CNX500", "CNX_DF"
		]

    SECTORAL_INDICES = [
      "BANKNIFTY", "CNXAUTO", "CNXENERGY", "CNXFMCG", "CNXINFRAST", "CNXIT", "CNXMEDIA",
      "CNXMETAL", "CNXMIDCAP", "CNXMNC", "CNXPHARMA", "CNXPSE", "CNXPSUBANK", "CNXREALTY",
    ]

    VOLATILITY_INDEX = ['INDIA VIX']

		search_by_range_on :last_traded_price
		search_by_range_on :percent_change
		search_by_range_on :net_change
		search_by_range_on :volume

    monetize :last_traded_price, :close_price, :net_change, :open_price, :high_price, :low_price
	end
end
