module Dion
  class Capitalstructure
    include Dion::Base

    KEYS = [ :company_code ]
    MODEL = DataProvider::Capitalstructure

	private
		def self.translate_fields(args)
			args[:modify_on] = args.delete(:modifyon)
			args
		end
  end
end
