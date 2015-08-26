class DataProvider::Rawmaterial
  include Mongoid::Document

  field :company_code
  field :year_ending, :type => Date
  field :modify_on, :type => DateTime
  field :element

  index :company_code, :background => true
  index :year_ending, :background => true
end
