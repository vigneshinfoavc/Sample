module Dion
  class BSEPrice
    include Dion::Base

    KEYS = [  :security_code, :price_date]
    MODEL = DataProvider::BsePrice
  end
end
