module Dion
  class DirectorsReport
    include Dion::Base

    KEYS = [ :company_code, :year_ending]
    MODEL = DataProvider::DirectorsReport
  end
end
