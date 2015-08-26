module Dion
  class ShareHolding
    include Dion::Base

    KEYS = [ :company_code, :share_holding_date ]
    MODEL = DataProvider::ShareHolding

	private
		def self.translate_fields(args)
			args[:modify_on] = args.delete(:modifyon)
			args
		end
  end
end
