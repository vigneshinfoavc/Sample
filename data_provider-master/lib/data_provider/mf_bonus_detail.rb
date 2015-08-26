class DataProvider::MfBonusDetail
  include Mongoid::Document

  field :security_code,   :type => Float
  field :bonus_date,     :type => Date
  field :ratio_offered,  :type => Float
  field :ratio_existing, :type => Float
  field :remarks
  field :modified_date,  :type => DateTime
  field :delete_flag
  field :row_id,         :type => Integer

  index :security_code, :background => true
  index :bonus_date, :background => true
end
