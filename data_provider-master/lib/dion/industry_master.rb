module Dion
  class IndustryMaster
    include Dion::Base

    KEYS = [ :code ]
    MODEL = DataProvider::Industry

  private
    def self.translate_fields(args)
      args[:code] = args.delete(:industry_code)
      args[:name] = args.delete(:industry_name)
      args
    end
  end
end
