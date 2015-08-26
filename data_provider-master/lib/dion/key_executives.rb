module Dion
  class KeyExecutives
    include Dion::Base

    KEYS = [ :company_code ]
    MODEL = DataProvider::KeyExecutive

	private
		def self.translate_fields(args)
			args[:modify_on] = args.delete(:modifyon)
			args
		end
  end
end
