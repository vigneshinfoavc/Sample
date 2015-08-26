class DataProvider::NetAssetValueCategory
  include Mongoid::Document

  field  :scheme_class_code, :type => Integer
  field  :scheme_class_description
  field  :no_of_schemes, :type => Integer
  field  :one_day_return, :type => Float
  field  :one_week_return, :type => Float
  field  :two_weeks_return, :type => Float
  field  :one_month_return, :type => Float
  field  :three_months_return, :type => Float
  field  :six_months_return, :type => Float
  field  :nine_months_return, :type => Float
  field  :one_year_return, :type => Float
  field  :two_year_return, :type => Float
  field  :three_year_return, :type => Float
  field  :modified_date, :type => DateTime

  index :scheme_class_code, :unique => true, :background => true
end
