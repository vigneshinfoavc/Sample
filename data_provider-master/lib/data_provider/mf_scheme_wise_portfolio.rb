class DataProvider::MfSchemeWisePortfolio
  include Mongoid::Document

  field :security_code
  field :holding_date, :type => Date
  field :modify_on, :type => DateTime
  field :element

  index :security_code, :background => true
  index :holding_date, :background => true
end
