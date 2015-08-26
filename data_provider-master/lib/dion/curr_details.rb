module Dion
  class CurrDetails
    include Dion::Base
      KEYS = [ :code ]
      MODEL = DataProvider::Company

  private
    def self.translate_fields(args)
      [ :fifty_twoweek_high, :fifty_twoweek_low, :book_closure_date, :price, :price_date ].each { |key| args.delete(key) }    #delete not required fields
			args[:code]									 = args.delete(:company_code)
      args[:pe]                    = args.delete(:pe_ratio)
      args[:price_to_book_value]   = args.delete(:p_bv)
      args[:dividend_yield]        = args.delete(:div_yield)
      args[:market_capitalization] = args.delete(:market_cap)

      args
    end
  end
end
