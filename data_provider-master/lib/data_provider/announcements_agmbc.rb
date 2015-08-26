class DataProvider::AnnouncementsAgmbc
  include Mongoid::Document

    field :company_code
    field :date_of_announcement, :type => Date
    field :agm_date, :type => Date
    field :year_ending, :type => Date
    field :purpose
    field :record_date, :type => Date
    field :book_closure_start_date, :type => Date
    field :book_closure_end_date, :type => Date
    field :source_code, :type => Integer
    field :source_name
    field :source_date, :type => Date
    field :remarks
    field :modified_date, :type => DateTime
    field :delete_flag

    index :company_code, :background => true
    index :date_of_announcement, :background => true
    index :agm_date, :background => true
end
