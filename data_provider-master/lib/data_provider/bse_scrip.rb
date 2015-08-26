require 'redis_record'

module DataProvider
	class BseScrip < RedisRecord
		include Scrip
    include CurrencyFormatter

		set_callback :save, :before, :percentage_gain_or_loss

		integer   :volume
		decimal   :last_traded_price, :open_price, :high_price, :low_price, :close_price,
							:percent_change, :net_change
		string    :id # ticker_name
		datetime  :time

		def company
			Company.where( ticker_name: id).first
		end

    TOP_500_COMPANY_LIST = BseTopListingCompany.all.map(&:id)

		BROAD_INDICES = [
      "SENSEX", "MIDCAP", "BSE200", "BSE500", "SMLCAP"
		]

    SECTORAL_INDICES = [
      "BSE CD", "BSE CG", "BSEFMC", "AUTO", "BANKEX", "REALTY", "TECK",
      "BSE HC", "BSE IT", "METAL", "OILGAS", "POWER", "BSEPSU",
    ]

    VOLATILITY_INDEX = ["BSEIPO", "DOL30"]

		search_by_range_on :last_traded_price
		search_by_range_on :percent_change
		search_by_range_on :net_change
		search_by_range_on :volume

    monetize :last_traded_price, :close_price, :net_change, :open_price, :high_price, :low_price

    def self.find_by_token_id(id)
      find_by_key
    end

    def percentage_gain_or_loss
      self.net_change = last_traded_price - close_price if valid_close_price? && last_traded_price && last_traded_price != ''
      self.percent_change = (net_change / close_price * 100).round(2) if net_change && valid_close_price?
    end
	end
end
