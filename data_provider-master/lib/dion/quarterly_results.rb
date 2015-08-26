module Dion
  class QuarterlyResults
    include Dion::Base

    KEYS = [ :company_code, :year_ending, :months, :quarter ]
    MODEL = DataProvider::QuarterlyResult
  end
end
