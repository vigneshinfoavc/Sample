module Dion
  class Products
    include Dion::Base

    KEYS = [ :company_code, :year_ending]
    MODEL = DataProvider::Product

	private
		def self.translate_fields(args)
			args[:modify_on] = args.delete(:modifyon)
			args
		end
  end
end
