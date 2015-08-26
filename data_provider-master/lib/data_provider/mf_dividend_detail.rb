class DataProvider::MfDividendDetail
  include Mongoid::Document

  field :security_code
  field :dividend_date, :type => Date
  field :percentage, :type => Float
  field :dividend_type, :type => Integer
  field :dividend_type_description
  field :remarks
  field :modified_date, :type => DateTime
  field :row_id, :type => Integer
  field :delete_flag

  index :security_code, :background => true
  index :dividend_date, :background => true
end
