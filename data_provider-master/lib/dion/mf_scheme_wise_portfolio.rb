module Dion
  class MFSchemeWisePortfolio
    include Dion::Base

    KEYS = [ :security_code, :holding_date ]
    MODEL = DataProvider::MfSchemeWisePortfolio

	private
		def self.translate_fields(args)
			args[:modify_on] = args.delete(:modifyon)
			args
		end
  end
end
