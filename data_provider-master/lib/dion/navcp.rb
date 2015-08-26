module Dion
  class NAVCP
    include Dion::Base

    KEYS = [ :security_code ]
    MODEL = DataProvider::Scheme

  private
    def self.translate_fields(args)
      [ :scheme_type, :scheme_type_description ].each { |key| args.delete(key) }    #delete not required fields
      args[:ticker_name]             = args.delete(:ticker)
      args[:prev1_week_percent]      = args.delete(:prev1_week_per)
      args[:prev1_month_percent]     = args.delete(:prev1_month_per)
      args[:prev3_months_percent]    = args.delete(:prev3_months_per)
      args[:prev6_months_percent]    = args.delete(:prev6_months_per)
      args[:prev9_months_percent]    = args.delete(:prev9_months_per)
      args[:prev_year_percent]       = args.delete(:prev_year_per)
      args[:prev2_year_percent]      = args.delete(:prev2_year_per)
      args[:prev2_year_comp_percent] = args.delete(:prev2_year_comp_per)
      args[:prev3_year_percent]      = args.delete(:prev3_year_per)
      args[:prev3_year_comp_percent] = args.delete(:prev3_year_comp_per)
      args[:list_percent]            = args.delete(:list_per)

      args
    end

  end
end
