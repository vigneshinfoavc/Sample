class DataProvider::Listing
  include Mongoid::Document

  field :security_code
  field :exchange_code, :type => Integer
  field :exchange_group
  field :scrip_code1_given_by_exchange
  field :scrip_code2_given_by_exchange
  field :date_of_listing, :type => Date
  field :date_of_de_listing, :type => Date
  field :date_of_re_enlisting, :type => Date
  field :first_traded_date, :type => Date
  field :first_traded_price, :type => Float
  field :last_traded_date, :type => Date
  field :last_traded_price, :type => Float
  field :fifty_two_week_high, :type => Float
  field :fifty_two_week_low, :type => Float
  field :high_date, :type => Date
  field :low_date, :type => Date
  field :circuit_breaker
  field :reason_for_modification
  field :last_modified_on, :type => DateTime
  field :delete_flag

  index :security_code, :background => true
  index :exchange_code, :background => true
  index :scrip_code1_given_by_exchange, :background => true
  index :scrip_code2_given_by_exchange, :background => true

  scope :nse, where( :exchange_code => "50")
  scope :bse, where( :exchange_code => "47")
end
