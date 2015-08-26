module DataProvider
	class AuditedResult
		include Mongoid::Document

			field  :company_code
			field  :year_ending,  :type => Date
			field  :months,  :type => Integer
			field  :type
			field  :face_value,  :type => Integer
			field  :operating_income,  :type => Float
			field  :manufacturing_expenses,  :type => Float
			field  :material_consumed,  :type => Float
			field  :personnel_expenses,  :type => Float
			field  :selling_expenses,  :type => Float
			field  :admin_expenses,  :type => Float
			field  :expenses_capitalised,  :type => Float
			field  :cost_of_sales,  :type => Float
			field  :banks_provisions_made,  :type => Float
			field  :operating_profit,  :type => Float
			field  :other_recurring_income,  :type => Float
			field  :adjusted_pbdit,  :type => Float
			field  :financial_expences,  :type => Float
			field  :depreciation,  :type => Float
			field  :prel_def_rev_exp_written_off,  :type => Float
			field  :adjusted_pbt,  :type => Float
			field  :taxation,  :type => Float
			field  :adjusted_pat,  :type => Float
			field  :non_recurring_income,  :type => Float
			field  :non_cash_adjustments,  :type => Float
			field  :reported_net_profit,  :type => Float
			field  :equity_dividend,  :type => Float
			field  :proposed_pref_dividend,  :type => Float
			field  :retained_earnings,  :type => Float
			field  :appropriations,  :type => Float
			field  :sales_manufacturing,  :type => Float
			field  :sales_trading,  :type => Float
			field  :excise,  :type => Float
			field  :fund_based_income,  :type => Float
			field  :fee_based_income,  :type => Float
			field  :fiscal_benefits,  :type => Float
			field  :raw_mat_consumed,  :type => Float
			field  :packing_material_consumed,  :type => Float
			field  :spares_stores_consmption,  :type => Float
			field  :purchase_finish_goods,  :type => Float
			field  :stock_adjustment,  :type => Float
			field  :power_fuel,  :type => Float
			field  :other_manufacturing_exp,  :type => Float
			field  :exp_advertising,  :type => Float
			field  :exp_other_promotion,  :type => Float
			field  :distribution_exp,  :type => Float
			field  :other_selling_expenses,  :type => Float
			field  :pl_sale_of_asset,  :type => Float
			field  :pl_on_sale_of_investments,  :type => Float
			field  :insurance_claims,  :type => Float
			field  :exchg_rate_fluct,  :type => Float
			field  :layoff_retrench_vrs,  :type => Float
			field  :extr_ordinary_items,  :type => Float
			field  :contingent_liabilities,  :type => Float
			field  :export_fob_value,  :type => Float
			field  :export_earnings,  :type => Float
			field  :cif_value_imports,  :type => Float
			field  :import_of_capital_goods,  :type => Float
			field  :foreign_exchange_expn,  :type => Float
			field  :imported_rawmaterials,  :type => Float
			field  :indigenious_rawmaterials,  :type => Float
			field  :imported_spares,  :type => Float
			field  :indigenious_spares,  :type => Float
			field  :equity_capital,  :type => Float
			field  :pref_capital,  :type => Float
			field  :share_appl_money,  :type => Float
			field  :authorised_capital,  :type => Float
			field  :reserves_and_surplus,  :type => Float
			field  :free_reserves_and_surplus,  :type => Float
			field  :other_reserves,  :type => Float
			field  :secured_loans,  :type => Float
			field  :unsecured_loans,  :type => Float
			field  :long_term_loan,  :type => Float
			field  :unsecured_term_loans,  :type => Float
			field  :borrowings_by_bank,  :type => Float
			field  :gross_block,  :type => Float
			field  :revaluation_reserve,  :type => Float
			field  :depreciation_on_f_assets,  :type => Float
			field  :net_block,  :type => Float
			field  :capital_wip,  :type => Float
			field  :investments,  :type => Float
			field  :current_assets,  :type => Float
			field  :curr_liab_and_prov,  :type => Float
			field  :net_current_assets,  :type => Float
			field  :cash_credits,  :type => Float
			field  :bills_purchased,  :type => Float
			field  :term_loans,  :type => Float
			field  :advances_outside_india,  :type => Float
			field  :adv_out_housing_loans,  :type => Float
			field  :inter_office_adj_net_liab,  :type => Float
			field  :misc_exp_not_written_off,  :type => Float
			field  :bonus_in_equity_cap,  :type => Float
			field  :number_of_equity_shares,  :type => Float
			field  :demand_deposits,  :type => Float
			field  :savings_deposits_unsecured,  :type => Float
			field  :time_deposits_unsecured,  :type => Float
			field  :deposits_of_indian_branches,  :type => Float
			field  :deposits_of_foreign_branches,  :type => Float
			field  :investment_outside_india,  :type => Float
			field  :book_value,  :type => Float
			field  :market_value,  :type => Float
			field  :cash_and_bank_balance,  :type => Float
			field  :money_at_call_short_notice,  :type => Float
			field  :receivables,  :type => Float
			field  :loans_and_advances,  :type => Float
			field  :raw_inventory,  :type => Float
			field  :wip_inventory,  :type => Float
			field  :finished_goods_inventory,  :type => Float
			field  :other_inventory,  :type => Float
			field  :sundry_creditors,  :type => Float
			field  :other_current_liabilities,  :type => Float
			field  :total_provisions,  :type => Float
			field  :current_year_adj,  :type => Float
			field  :prev_year_adj,  :type => Float
			field  :adjusted_fixed_assets,  :type => Float
			field  :purchases,  :type => Float
			field  :number_of_employees,  :type => Integer
			field  :number_of_branches,  :type => Integer
			field  :corporate_dividend_tax,  :type => Float
			field  :modified_date,  :type => DateTime

      index :company_code, :background => true
      index :year_ending, :background => true

			[
				:equity_capital, :share_appl_money, :pref_capital, :reserves_and_surplus, :revaluation_reserve,
				:long_term_loan, :unsecured_term_loans, :unsecured_loans, :borrowings_by_bank, :cash_credits,
				:bills_purchased, :term_loans, :net_block, :capital_wip, :net_current_assets, :misc_exp_not_written_off,
				:investments, :cash_credits, :bills_purchased, :term_loans, :cash_and_bank_balance,
				:money_at_call_short_notice, :raw_inventory, :wip_inventory, :finished_goods_inventory,
				:other_inventory, :excise, :operating_income, :other_recurring_income, :non_recurring_income,
				:adjusted_pbdit, :financial_expences, :extr_ordinary_items, :layoff_retrench_vrs, :insurance_claims,
				:reported_net_profit, :number_of_equity_shares
			].each do |attr|                                          ##
				define_method "#{attr}!" do                             # def attr!
					send(attr) || 0.0                                     #   attr || 0.0
				end                                                     # end
			end                                                       ##

		def banking_company?
			@company ||= Company.where( code: company_code).first
			@company.major_sector == 2
		end
		def net_worth
			@net_worth ||= total_share_capital + reserves_and_surplus!
			@net_worth += revaluation_reserve! unless banking_company?
			@net_worth
		end

		def total_share_capital
			@total_share_capital ||= equity_capital!+ share_appl_money! + pref_capital!
		end

		def total_debt
			long_term_loan! + unsecured_term_loans! unless banking_company?
		end

		def total_liabilities
			net_worth + ( banking_company? ? unsecured_loans! + borrowings_by_bank! : total_debt )
		end

		def advances
			(cash_credits! + bills_purchased!  + term_loans!) if banking_company?
		end

		def total_assets
			value = net_block! + capital_wip! + net_current_assets! + misc_exp_not_written_off! + investments!
			value += advances + cash_and_bank_balance! + money_at_call_short_notice! if banking_company?
			value
		end

		def inventory
			raw_inventory! + wip_inventory! + finished_goods_inventory! + other_inventory!
		end

		def sales
			operating_income!+ excise! unless banking_company?
		end

		def other_income
			other_recurring_income! + non_recurring_income! unless banking_company?
		end

		def total_income
			operating_income!+ other_recurring_income!+ non_recurring_income! unless banking_company?
		end

		def pbdt
			adjusted_pbdit! - financial_expences! unless banking_company?
		end

		def extra_ordinary_items
			extr_ordinary_items! + layoff_retrench_vrs! + insurance_claims! unless banking_company?
		end

		def earnings_per_share
			(reported_net_profit / number_of_equity_shares).round(2) if reported_net_profit && number_of_equity_shares
		end
	end
end
