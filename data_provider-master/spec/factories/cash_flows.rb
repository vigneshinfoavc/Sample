# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :'data_provider/cash_flow' do
    year_ending	  "31/03/2010"
    months	      12
    type	        "U"
  end
end
