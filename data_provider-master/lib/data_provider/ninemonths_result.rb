class DataProvider::NinemonthsResult
  include Mongoid::Document

  field :company_code
  field :year_ending, :type => Integer
  field :months, :type => Integer
  field :nine, :type => Integer
  field :operating_income, :type => Float
  field :other_recurring_income, :type => Float
  field :stock_adjustment, :type => Float
  field :raw_material_consumed, :type => Float
  field :power_and_fuel, :type => Float
  field :employee_expenses, :type => Float
  field :excise, :type => Float
  field :admin_and_selling_expenses, :type => Float
  field :research_and_devlopment_expenses, :type => Float
  field :expenses_capitalised, :type => Float
  field :other_expeses, :type => Float
  field :bank_provisions_made, :type => Float
  field :interest_charges, :type => Float
  field :gross_profit, :type => Float
  field :depreciation, :type => Float
  field :tax_charges, :type => Float
  field :extra_ordinary_item, :type => Float
  field :reported_pat, :type => Float
  field :prior_year_adj, :type => Float
  field :reserves_written_back, :type => Float
  field :equity_capital, :type => Float
  field :reserves_and_surplus, :type => Float
  field :eq_dividend_rate, :type => Float
  field :aggregateof_non_promoto_no_of_shares, :type => Float
  field :aggregateof_non_promoto_holding_percent, :type => Float
  field :government_share, :type => Float
  field :capital_adequacy_ratio, :type => Float
  field :eps, :type => Float
  field :notes
  field :segment_notes
  field :modified_date, :type => DateTime

  index :company_code, :background => true
  index :year_ending, :background => true
  index :months, :background => true
  index :nine, :background => true

end
