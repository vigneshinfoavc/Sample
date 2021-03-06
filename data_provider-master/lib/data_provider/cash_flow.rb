class DataProvider::CashFlow
  include Mongoid::Document

  field  :company_code
  field  :year_ending, :type => Date
  field  :months, :type => Integer
  field  :type, :type => Float
  field  :profits_before_tax, :type => Float
  field  :profits_after_tax, :type => Float
  field  :depreciation, :type => Float
  field  :final_lease, :type => Float
  field  :lease_eq_res, :type => Float
  field  :pl_in_forex, :type => Float
  field  :gain_forex, :type => Float
  field  :pl_on_sale_of_assets, :type => Float
  field  :pl_on_sale_of_investments, :type => Float
  field  :profit_adj_on_sale_of_undertaking, :type => Float
  field  :interest_income, :type => Float
  field  :interest_paid_net, :type => Float
  field  :interest_net, :type => Float
  field  :dividend_received_operating_activity, :type => Float
  field  :dividend_net, :type => Float
  field  :investments, :type => Float
  field  :misc_income, :type => Float
  field  :amortisation_of_exps_on_operating_activity, :type => Float
  field  :assets_written_off, :type => Float
  field  :misc_exp, :type => Float
  field  :payment_to_vrs, :type => Float
  field  :provisions_written_off_net, :type => Float
  field  :provisions_gratutity, :type => Float
  field  :provisions_dimun_in_value_of_investment, :type => Float
  field  :provisions_for_bad_debts_npa, :type => Float
  field  :trade_and_other_receivables, :type => Float
  field  :trade_bills_purchased, :type => Float
  field  :inventories_operating_activity, :type => Float
  field  :trade_payble, :type => Float
  field  :tax_provision, :type => Float
  field  :direct_taxes, :type => Float
  field  :advance_tax_paid, :type => Float
  field  :loans_and_advances, :type => Float
  field  :transfer_from_reserve, :type => Float
  field  :others_from_operating_activity, :type => Float
  field  :prior_year_adjustments, :type => Float
  field  :provisions_written_back, :type => Float
  field  :prior_year_tax, :type => Float
  field  :balances_written_back, :type => Float
  field  :other_assets, :type => Float
  field  :other_liabilites, :type => Float
  field  :change_in_deposits, :type => Float
  field  :change_in_borrowing, :type => Float
  field  :discounts_expenses_on_loans, :type => Float
  field  :increase_or_decrease_in_advances, :type => Float
  field  :increase_or_decrease_in_investments, :type => Float
  field  :net_stock_on_hire, :type => Float
  field  :leased_assets_net_of_sale, :type => Float
  field  :excess_depreciation_written_back, :type => Float
  field  :premium_on_lease_of_land, :type => Float
  field  :extra_ordinary_items, :type => Float
  field  :net_cash_flow_operating_activity, :type => Float
  field  :purchase_of_fixed_assets, :type => Float
  field  :sale_of_fixed_assets, :type => Float
  field  :capital_wip, :type => Float
  field  :capital_subsidy_received, :type => Float
  field  :purchase_of_investments, :type => Float
  field  :sale_of_investment_inves_activity, :type => Float
  field  :aquisition_of_companies, :type => Float
  field  :sale_of_undertaking_extra_ordinary_item, :type => Float
  field  :interest_received, :type => Float
  field  :dividend_received_iinvestment_activity, :type => Float
  field  :investment_income, :type => Float
  field  :inter_corporate_deposits, :type => Float
  field  :investment_in_subsidiaries, :type => Float
  field  :loan_to_subsidiaries, :type => Float
  field  :investment_in_group_co, :type => Float
  field  :iss_sh_acq_co, :type => Float
  field  :canc_inv_cos, :type => Float
  field  :certificate_of_deposit_in_bank, :type => Float
  field  :movment_in_loans, :type => Float
  field  :others_from_investment_activity, :type => Float
  field  :movement_in_working_capital, :type => Float
  field  :amortisation_of_exps_on_investment_activity, :type => Float
  field  :taxes_paid, :type => Float
  field  :expenses_capitalised, :type => Float
  field  :extra_ord_items_investment_activity, :type => Float
  field  :purchase_of_fixed_assets_leased_out, :type => Float
  field  :net_increase_or_decrease_in_current_asset, :type => Float
  field  :net_increase_or_decrease_in_advances, :type => Float
  field  :net_increase_or_decrease_in_current_liabilities, :type => Float
  field  :net_cash_used_in_investment_activity, :type => Float
  field  :proceedings_from_issue_of_equity_capital, :type => Float
  field  :proceedings_from_issue__of_pref_capital, :type => Float
  field  :proceedings_from_issue_of_sh_capital_inclusive_share_premimum, :type => Float
  field  :redemption_capital, :type => Float
  field  :proceedings_from_issue_of_debentures, :type => Float
  field  :proceedings_from_bank_borrowings, :type => Float
  field  :proceedings_from_long_term_borrowings, :type => Float
  field  :proceddings_from_short_term_borrowings, :type => Float
  field  :proceedings_from_deposits, :type => Float
  field  :repayment_of_borrowings, :type => Float
  field  :share_application, :type => Float
  field  :loan_from_corporate_body, :type => Float
  field  :dividend_paid, :type => Float
  field  :interest_paid, :type => Float
  field  :financial_charges, :type => Float
  field  :cash_credit_advances, :type => Float
  field  :cash_capital_investment, :type => Float
  field  :others_from_financial_activity, :type => Float
  field  :foreign_exchange_gain_or_loss_from_fin_activity, :type => Float
  field  :share_premium, :type => Float
  field  :misc_exp_written_off, :type => Float
  field  :sale_of_investments_fin_activity, :type => Float
  field  :reserves, :type => Float
  field  :current_liabilities, :type => Float
  field  :loan_disbursed, :type => Float
  field  :inventory_fin_activity, :type => Float
  field  :extra_ord_item_fin_activity, :type => Float
  field  :deferrred_exp_against_borrowing, :type => Float
  field  :share_application_refund, :type => Float
  field  :on_redem_of_debentures, :type => Float
  field  :of_other_long_term_borrowings, :type => Float
  field  :of_short_term_borrowings, :type => Float
  field  :of_finance_lease_liabilities, :type => Float
  field  :shelter_assisant_reserve, :type => Float
  field  :repayment_of_short_term_borrowings, :type => Float
  field  :repayment_of_long_term_borrowings, :type => Float
  field  :net_cash_used_in_fin_activity, :type => Float
  field  :foreign_exchange_gain_loss_net_in_fin_activity, :type => Float
  field  :net_increase_or_decrease_in_cash, :type => Float
  field  :cash_start_year, :type => Float
  field  :cash_end_year, :type => Float
  field  :modified_date, :type => DateTime

  index :company_code, :background => true
  index :year_ending, :background => true
end
