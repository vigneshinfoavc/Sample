module Dion
  class Rawmaterial
    include Dion::Base

    KEYS = [ :company_code, :year_ending]
    MODEL = DataProvider::Rawmaterial

	private
		def self.translate_fields(args)
			args[:modify_on] = args.delete(:modifyon)
			args
		end
  end
end
