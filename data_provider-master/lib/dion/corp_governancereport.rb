module Dion
  class CorpGovernancereport
    include Dion::Base

    KEYS = [ :company_code, :year_ending]
    MODEL = DataProvider::CorpGovernancereport

	private
		def self.translate_fields(args)
			args[:delete_flag] = args.delete(:deleteflag)
			args
		end

  end
end
