module Dion
  class AuditorsReport
    include Dion::Base

    KEYS = [ :company_code, :year_ending]
    MODEL = DataProvider::AuditorsReport
  end
end
