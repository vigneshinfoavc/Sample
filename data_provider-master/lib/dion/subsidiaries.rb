module Dion
  class Subsidiaries
    include Dion::Base

    KEYS = [ :company_code, :parent_company_code ]
    MODEL = DataProvider::Subsidiary
  end
end
