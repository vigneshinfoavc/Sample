module Dion
  class Dividend
    include Dion::Base

    KEYS = [ :company_code, :date_of_announcement ]
    MODEL = DataProvider::Dividend
  end
end
