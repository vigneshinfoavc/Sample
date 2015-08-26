module Dion
  class BankingRatios
    include Dion::Base

    KEYS = [ :company_code, :year_ending]
    MODEL = DataProvider::BankingRatio
  end
end
