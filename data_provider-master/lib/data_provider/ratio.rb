class DataProvider::Ratio
  include Mongoid::Document

  field :company_code
  field :year_ending, :type => Date
  field :months, :type => Integer
  field :type
  field :face_value, :type => Integer
  field :adjusted_eps, :type => Float
  field :adjusted_cash_eps, :type => Float
  field :return_on_assets_excl, :type => Float
  field :return_on_assets_incl, :type => Float
  field :dividend_per_share, :type => Float
  field :reported_eps, :type => Float
  field :reported_cash_eps, :type => Float
  field :op_profit_per_share, :type => Float
  field :net_operating_income_per_share, :type => Float
  field :free_reserves_per_share, :type => Float
  field :operating_margin, :type => Float
  field :reported_return_on_net_worth, :type => Float
  field :adjusted_return_on_networth, :type => Float
  field :adjusted_cash_margin, :type => Float
  field :returnon_long_term_fund, :type => Float
  field :current_ratio, :type => Float
  field :quick_ratio, :type => Float
  field :average_raw_mat_holding, :type => Float
  field :averagefinished_goods_hold, :type => Float
  field :no_of_daysin_workingcap, :type => Float
  field :long_term_debt_equity, :type => Float
  field :owners_fund, :type => Float
  field :total_debtto_ownersfund, :type => Float
  field :current_ratio_incl_short_term_loans, :type => Float
  field :asset_turnover_ratio, :type => Float
  field :long_term_assets, :type => Float
  field :financial_charges_coverage_ratio, :type => Float
  field :financial_charges_coverage_ratio_post_tax, :type => Float
  field :dividend_payout_ratio_np, :type => Float
  field :dividend_payout_ratio_cp, :type => Float
  field :earning_retention_ratio, :type => Float
  field :cash_earning_retention_ratio, :type => Float
  field :material_cost_composition, :type => Float
  field :sell_distribut_cost_comp, :type => Float
  field :investments_turn_ratio, :type => Float
  field :adjusted_cash_flow_times, :type => Float
  field :imported_compof_rawmaterialconsumed, :type => Float
  field :exp_as_total_sales, :type => Float
  field :interest_spread, :type => Float
  field :operating_expby_op_income, :type => Float
  field :n_pby_operatin_income, :type => Float
  field :npby_capital_employed, :type => Float
  field :averagecostoffunds, :type => Float
  field :average_yieldon_assets, :type => Float
  field :average_returnon_investments, :type => Float
  field :gross_profit_margin, :type => Float
  field :net_profit_margin, :type => Float
  field :bonus_in_equity_capital, :type => Float
  field :capital_adequacy_ratio, :type => Float
  field :book_value_per_share, :type => Float
  field :price_to_sales, :type => Float
  field :div_yield_per, :type => Float
  field :enterprise_value_to_core_ebitda, :type => Float
  field :price_to_book_value, :type => Float
  field :debt_ratio, :type => Float
  field :roa_per, :type => Float
  field :roe_per, :type => Float
  field :pre_tax_margin_per, :type => Float
  field :interest_coverage, :type => Float
  field :opearing_cash_flow_to_debt_ratio, :type => Float
  field :operating_cash_flow_to_sales_ratio, :type => Float
  field :price_to_operating_cash_flow_ratio, :type => Float
  field :capitalization_ratio, :type => Float
  field :modified_date, :type => DateTime

  index :company_code, :background => true
  index :year_ending, :background => true
end
