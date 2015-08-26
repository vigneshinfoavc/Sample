module Dion
  class SchemeMaster
    include Dion::Base

    KEYS = [ :security_code ]
    MODEL = DataProvider::Scheme

  private
    def self.translate_fields(args)
			args[:security_code]                 = args.delete(:securitycode)
      args[:name]                          = args.delete(:scheme_name)
      args[:type]                          = args.delete(:scheme_type)
      args[:type_description]              = args.delete(:scheme_type_description)
      args[:plan_code]                     = args.delete(:scheme_plan_code)
      args[:plan_description]              = args.delete(:scheme_plan_description)
      args[:class_code]                    = args.delete(:scheme_class_code)
      args[:class_description]             = args.delete(:scheme_class_description)
			args[:minimum_investment_amount]     = args.delete(:minimum_invement_amount)
      args[:asset_management_company_code] = args.delete(:amc_code)
      args[:redemption_frequency]          = args.delete(:redemption_ferq)
      args
    end

  end
end
