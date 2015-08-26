class DataProvider::News
  include Mongoid::Document

  field :company_code
  field :news_date, :type => Date
  field :headlines
  field :source_name
  field :news_type_description
  field :news_classfication
  field :notes
  field :modify_on, :type => DateTime

  index :company_code, :background => true
  index :news_date, :background => true
  index :headlines, :background => true

  scope :for_company, lambda { |company_code| where( company_code: company_code) }
  scope :latest, lambda { |limit| order_by(:modify_on => :desc).limit(limit) }

end
