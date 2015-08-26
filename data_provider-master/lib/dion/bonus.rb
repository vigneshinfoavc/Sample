module Dion
  class Bonus
    include Dion::Base

    KEYS = [ :company_code, :year_ending]
    MODEL = DataProvider::Bonus
  end
end
