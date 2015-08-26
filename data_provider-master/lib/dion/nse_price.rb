module Dion
  class NSEPrice
    include Dion::Base

    KEYS = [ :security_code, :price_date]
    MODEL = DataProvider::NsePrice
  end
end
