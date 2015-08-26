module Dion
  class NinemonthsResults
    include Dion::Base

    KEYS = [ :company_code, :year_ending, :months, :nine ]
    MODEL = DataProvider::NinemonthsResult
  end
end
