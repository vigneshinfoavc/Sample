module Dion
  class CompanyMaster
    include Dion::Base

    KEYS = [:code]
    MODEL = DataProvider::Company

  private
    def self.translate_fields(args)
      {
        :code => args.delete(:company_code),
        :ticker_name => args.delete(:ticker_name)
      }
    end
  end
end
