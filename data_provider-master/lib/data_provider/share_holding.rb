class DataProvider::ShareHolding
  include Mongoid::Document

  field :company_code
  field :share_holding_date, :type => Date
  field :modify_on, :type => DateTime
  field :element

  index :company_code, :background => true
  index :share_holding_date, :background => true
end
