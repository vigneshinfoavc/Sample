module Dion
  class HalfyearlyResults
    include Dion::Base

    KEYS = [ :company_code, :year_ending, :months, :half ]
    MODEL = DataProvider::HalfyearlyResult
  end
end
