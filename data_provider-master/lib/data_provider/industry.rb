class DataProvider::Industry
  include Mongoid::Document

  field :code, :type => Integer
  field :name
  field :broad_industry_code, :type => Integer
  field :broad_industry_name
  field :major_sector_code, :type => Integer
  field :major_sector_name
  field :modified_date, :type => DateTime
  field :delete_flag

  index :code, :unique => true, :background => true
  index :broad_industry_code, :unique => true, :background => true
end
