# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :'data_provider/bse_scrip' do
    last_traded_price 5
  end
end
