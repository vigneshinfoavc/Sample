class DataProvider::Capitalstructure
  include Mongoid::Document

  field :company_code
  field :modify_on, :type => DateTime
  field :element

  index :company_code, :background => true
end
