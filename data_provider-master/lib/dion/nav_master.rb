module Dion
  class NavMaster
    include Dion::Base

    KEYS = [ :security_code ]
    MODEL = DataProvider::Scheme

  private
    def self.translate_fields(args)
      [ :scheme_plan_code, :scheme_plan_description, :ticker_name, :modified_date, :delete_flag ].each { |key| args.delete(key) }    #delete not required fields
      args[:code] = args.delete(:scheme_code)
			args
    end

  end
end
