module Dion
  class MFBonusDetails
    include Dion::Base

    KEYS = [ :security_code, :bonus_date ]
    MODEL = DataProvider::MfBonusDetail

	private
		def self.translate_fields(args)
			args[:security_code] = args.delete(:securitycode)
			args
		end
  end
end
