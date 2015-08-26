class DataProvider::BankingRatio
  include Mongoid::Document

  field :company_code
  field :year_ending, :type => Date
  field :months, :type => Integer
  field :type
  field :face_value, :type => Integer
  field :capital_adequacy_ratio, :type => Float
  field :income_from_fund_advances_as_a_per_of_op_income, :type => Float
  field :operating_income_as_a_per_of_working_funds, :type => Float
  field :fund_based_income_as_a_per_of_op_income, :type => Float
  field :fee_based_income_as_a_per_of_op_income, :type => Float
  field :yield_on_fund_advances, :type => Float
  field :break_even_yield_ratio, :type => Float
  field :cost_of_funds_ratio, :type => Float
  field :net_profit_margin, :type => Float
  field :reported_return_on_net_worth, :type => Float
  field :adjusted_return_on_net_worth, :type => Float
  field :borrowings_from_rbi_as_per_to_total_borrowings, :type => Float
  field :borrowings_from_other_banks_as_a_per_to_total_borrowings, :type => Float
  field :borrowings_from_others_as_a_per_to_total_borrowings, :type => Float
  field :borrowings_within_india_as_a_per_to_total_borrowings, :type => Float
  field :borrowings_from_outside_india_as_a_per_to_total_borrowings, :type => Float
  field :demand_deposit_of_total_deposits, :type => Float
  field :saving_deposit_of_total_deposits, :type => Float
  field :time_deposit_of_total_deposits, :type => Float
  field :deposits_within_india_as_per_to_total_deposits, :type => Float
  field :deposits_outside_india_as_per_to_total_deposits, :type => Float
  field :operating_income_per_branch, :type => Float
  field :operating_profit_per_branch, :type => Float
  field :net_profit_per_branch, :type => Float
  field :personnel_expenses_per_branch, :type => Float
  field :adminstrative_expenses_per_branch, :type => Float
  field :financial_expenses_per_branch, :type => Float
  field :borrowings_per_branch, :type => Float
  field :deposits_per_branch, :type => Float
  field :operating_income_per_employee, :type => Float
  field :operating_profit_per_employee, :type => Float
  field :net_profit_per_employee, :type => Float
  field :personnel_expenses_per_employee, :type => Float
  field :deposits_per_employee, :type => Float
  field :fund_advances_per_employee, :type => Float
  field :modified_date, :type => DateTime

  index :company_code, :background => true
  index :year_ending, :background => true
end
