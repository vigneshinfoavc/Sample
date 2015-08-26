class DataProvider::CorpGovernancereport
  include Mongoid::Document

  field :company_code
  field :year_ending, :type => Date
  field :notes
  field :modified_date, :type => DateTime
  field :delete_flag

  index :company_code, :background => true
  index :year_ending, :background => true
end
