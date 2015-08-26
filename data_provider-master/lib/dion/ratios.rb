module Dion
  class Ratios
    include Dion::Base

    KEYS = [ :company_code, :year_ending]
    MODEL = DataProvider::Ratio
  end
end
