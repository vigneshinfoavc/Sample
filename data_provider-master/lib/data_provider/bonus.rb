class DataProvider::Bonus
  include Mongoid::Document

  field :company_code
  field :year_ending, :type => Date
  field :ratio
  field :xb_date, :type => Date
  field :modified_date, :type => DateTime

  index :company_code, :background => true
  index :year_ending, :background => true
end
