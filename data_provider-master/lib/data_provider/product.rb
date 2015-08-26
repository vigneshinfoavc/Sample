class DataProvider::Product
  include Mongoid::Document

  field :company_code
  field :year_ending, :type => Date
  field :no_of_months, :type => Integer
  field :modify_on, :type => DateTime
  field :element

  index :company_code, :background => true
  index :year_ending, :background => true
end
