module Dion
  class AccountingPolicy
    include Dion::Base

    KEYS = [ :company_code, :year_ending]
    MODEL = DataProvider::AccountingPolicy
  end
end
