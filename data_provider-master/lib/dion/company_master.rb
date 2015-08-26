module Dion
  class CompanyMaster
    include Dion::Base

    KEYS = [ :code ]
    MODEL = DataProvider::Company

  private
    def self.translate_fields(args)
      args[:code] = args.delete(:company_code)
      args[:name] = args.delete(:company_name)
      args[:short_name] = args.delete(:short_company_name)
      args
    end
  end
end
