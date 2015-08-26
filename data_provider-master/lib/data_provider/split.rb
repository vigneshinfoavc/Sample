class DataProvider::Split
  include Mongoid::Document

  field :company_code
  field :date_of_announcement, :type => Date
  field :old_face_value, :type => Float
  field :new_face_value, :type => Float
  field :record_date, :type => Date
  field :book_closure_start_date, :type => Date
  field :book_closure_end_date, :type => Date
  field :xs_date, :type => Date
  field :modified_date, :type => DateTime
  field :delete_flag

  index :company_code, :background => true
  index :date_of_announcement, :background => true
end
