module Dion
  class AnnouncementsAGMBC
    include Dion::Base

    KEYS = [ :company_code, :date_of_announcement, :agm_date ]
    MODEL = DataProvider::AnnouncementsAgmbc
  end
end
