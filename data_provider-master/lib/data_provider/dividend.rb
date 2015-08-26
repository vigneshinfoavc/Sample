class DataProvider::Dividend
  include Mongoid::Document

  field  :company_code
  field  :date_of_announcement, :type => DateTime
  field  :interim_or_final
  field  :instrument_type, :type => Integer
  field  :instrument_type_description
  field  :percentage, :type => Float
  field  :value, :type => Float
  field  :record_date, :type => Date
  field  :book_closure_start_date, :type => Date
  field  :book_closure_end_date, :type => Date
  field  :remarks
  field  :modified_date, :type => DateTime
  field  :del_flag
  field  :xd_date, :type => DateTime

  index :company_code, :background => true
  index :date_of_announcement, :background => true
end
