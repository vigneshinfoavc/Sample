module Dion
  class Splits
    include Dion::Base

    KEYS = [ :company_code, :date_of_announcement ]
    MODEL = DataProvider::Split

  private
    def self.translate_fields(args)
      args[:company_code]                 = args.delete(:companycode)
      args
    end

  end
end
