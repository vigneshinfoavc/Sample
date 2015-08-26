class DataProvider::NsePrice
  include Mongoid::Document

    field :security_code
    field :price_date, :type => Date
    field :open_price, :type => Float
    field :high_price, :type => Float
    field :low_price, :type => Float
    field :close_price, :type => Float
    field :trading_day_close_indicator
    field :traded_value, :type => Float
    field :traded_quantity, :type => Integer
    field :number_of_trades, :type => Integer
    field :modified_date, :type => DateTime

    index :security_code, :background => true
    index :price_date, :background => true
end
