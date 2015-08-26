module Dion
  class AuditedResults
    include Dion::Base

    KEYS = [ :company_code, :year_ending]
    MODEL = DataProvider::AuditedResult

  private
    def self.translate_fields(args)
      args[:company_code]                 = args.delete(:companycode)
      args[:manufacturing_expenses]       = args.delete(:manufacturingexpenses)
      args[:personnel_expenses]           = args.delete(:personnel_exp)
      args[:expenses_capitalised]         = args.delete(:exp_capitalised)
      args[:fund_based_income]            = args.delete(:fundbased_income)
      args[:fee_based_income]             = args.delete(:feebased_income)
      args[:pl_on_sale_of_investments]    = args.delete(:pl_onsaleof_invstmts)
      args[:insurance_claims]             = args.delete(:insuranceclaims)
      args[:layoff_retrench_vrs]          = args.delete(:layoffretrench_vrs)
      args[:import_of_capital_goods]      = args.delete(:imp_capital_goods)
      args[:imported_rawmaterials]        = args.delete(:imported_rawmat)
      args[:indigenious_rawmaterials]     = args.delete(:indigenious_rawmat)
      args[:reserves_and_surplus]         = args.delete(:resand_surplus)
      args[:free_reserves_and_surplus]    = args.delete(:free_reservesand_surplus)
      args[:number_of_equity_shares]      = args.delete(:numberof_equity_shares)
      args[:savings_deposits_unsecured]   = args.delete(:savings_deposits_un_secured)
      args[:time_deposits_unsecured]      = args.delete(:time_deposits_un_secured)
      args[:deposits_of_indian_branches]  = args.delete(:dep_of_ind_branches)
      args[:deposits_of_foreign_branches] = args.delete(:dep_of_forgn_branches)
      args[:investment_outside_india]     = args.delete(:inv_india)
      args[:loan_and_advances]            = args.delete(:loan_adv)
      args[:adjusted_fixed_assets]        = args.delete(:adj_fix_ass)

      args
    end

  end
end
