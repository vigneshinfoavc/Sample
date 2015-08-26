module Dion
  class NotesToAccount
    include Dion::Base

    KEYS = [ :company_code, :year_ending ]
    MODEL = DataProvider::NotesToAccount
  end
end
