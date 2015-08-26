module Dion
  class MFDividendDetails
    include Dion::Base

    KEYS = [ :security_code, :dividend_date ]
    MODEL = DataProvider::MfDividendDetail

	private
		def self.translate_fields(args)
			args[:security_code] = args.delete(:securitycode)
			args
		end
  end
end
