module Dion
  class FundMaster
		include Dion::Base

		KEYS = [:company_code]
    MODEL = DataProvider::AssetManagementCompany

  private
		def self.translate_fields(args)
			args[:code] = args.delete(:amc_code)
			args[:name] = args.delete(:amc_name)
			args[:incorporation_date] = args.delete(:amc_inc_date)
			args
		end
	end
end
