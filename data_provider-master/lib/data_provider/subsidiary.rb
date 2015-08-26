class DataProvider::Subsidiary
  include Mongoid::Document

  field :company_code
  field :company_name
  field :parent_company_code
  field :parent_company_name
  field :modified_date, :type => DateTime
  field :deleteflag

  index :company_code, :background => true
  index :parent_company_code, :background => true

end
