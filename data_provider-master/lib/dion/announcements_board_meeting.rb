module Dion
  class AnnouncementsBoardMeeting
    include Dion::Base

    KEYS = [ :company_code, :year_ending]
    MODEL = DataProvider::AnnouncementsBoardMeeting
  end
end
